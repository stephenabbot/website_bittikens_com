#!/bin/bash
# scripts/manage-cloudfront-auth.sh - Manage CloudFront Function basic auth
# Usage: ./scripts/manage-cloudfront-auth.sh {enable|disable|status}

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "$PROJECT_ROOT"

export AWS_PAGER=""

# Load configuration
source "${PROJECT_ROOT}/config.env"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() { echo -e "${BLUE}ℹ${NC} $1"; }
print_success() { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }

FUNCTION_NAME="basic-auth-${DOMAIN_NAME//./-}"
FUNCTION_SOURCE="${SCRIPT_DIR}/cloudfront-basic-auth.js"

get_distribution_id() {
    aws ssm get-parameter \
        --region "$AWS_REGION" \
        --name "/static-website/infrastructure/${DOMAIN_NAME}/cloudfront-distribution-id" \
        --query Parameter.Value --output text
}

get_function_etag() {
    aws cloudfront describe-function \
        --name "$FUNCTION_NAME" \
        --query 'ETag' --output text 2>/dev/null || echo ""
}

enable_auth() {
    print_status "Enabling basic auth for ${DOMAIN_NAME}..."

    DISTRIBUTION_ID=$(get_distribution_id)
    print_status "CloudFront distribution: ${DISTRIBUTION_ID}"

    # Read the function source
    FUNCTION_CODE=$(cat "$FUNCTION_SOURCE")

    # Check if function already exists
    EXISTING_ETAG=$(get_function_etag)

    if [ -n "$EXISTING_ETAG" ] && [ "$EXISTING_ETAG" != "None" ]; then
        print_status "Updating existing CloudFront Function..."
        RESULT=$(aws cloudfront update-function \
            --name "$FUNCTION_NAME" \
            --function-config '{"Comment":"Basic auth for '"${DOMAIN_NAME}"'","Runtime":"cloudfront-js-2.0"}' \
            --function-code fileb://"$FUNCTION_SOURCE" \
            --if-match "$EXISTING_ETAG" \
            --query 'ETag' --output text)
    else
        print_status "Creating CloudFront Function..."
        RESULT=$(aws cloudfront create-function \
            --name "$FUNCTION_NAME" \
            --function-config '{"Comment":"Basic auth for '"${DOMAIN_NAME}"'","Runtime":"cloudfront-js-2.0"}' \
            --function-code fileb://"$FUNCTION_SOURCE" \
            --query 'ETag' --output text)
    fi

    # Publish the function
    print_status "Publishing function..."
    PUBLISH_ETAG=$(aws cloudfront describe-function \
        --name "$FUNCTION_NAME" \
        --query 'ETag' --output text)

    LIVE_ETAG=$(aws cloudfront publish-function \
        --name "$FUNCTION_NAME" \
        --if-match "$PUBLISH_ETAG" \
        --query 'FunctionSummary.FunctionMetadata.Stage' --output text)
    print_success "Function published"

    # Get the function ARN
    FUNCTION_ARN=$(aws cloudfront describe-function \
        --name "$FUNCTION_NAME" \
        --stage LIVE \
        --query 'FunctionSummary.FunctionMetadata.FunctionARN' --output text)
    print_status "Function ARN: ${FUNCTION_ARN}"

    # Get current distribution config
    print_status "Updating distribution..."
    DIST_CONFIG_FILE=$(mktemp)
    DIST_ETAG=$(aws cloudfront get-distribution-config \
        --id "$DISTRIBUTION_ID" \
        --query 'ETag' --output text)

    aws cloudfront get-distribution-config \
        --id "$DISTRIBUTION_ID" \
        --query 'DistributionConfig' > "$DIST_CONFIG_FILE"

    # Check if function association already exists
    EXISTING_ASSOC=$(jq -r '.DefaultCacheBehavior.FunctionAssociations.Items[]? | select(.EventType == "viewer-request") | .FunctionARN' "$DIST_CONFIG_FILE" 2>/dev/null || echo "")

    if [ "$EXISTING_ASSOC" = "$FUNCTION_ARN" ]; then
        print_warning "Function already associated with distribution"
        rm -f "$DIST_CONFIG_FILE"
        return 0
    fi

    # Add or update the function association for viewer-request
    jq --arg arn "$FUNCTION_ARN" '
        .DefaultCacheBehavior.FunctionAssociations = {
            "Quantity": 1,
            "Items": [{"FunctionARN": $arn, "EventType": "viewer-request"}]
        }
    ' "$DIST_CONFIG_FILE" > "${DIST_CONFIG_FILE}.new"

    # Check if there are existing function associations we need to preserve (like index rewriting)
    EXISTING_COUNT=$(jq -r '.DefaultCacheBehavior.FunctionAssociations.Quantity // 0' "$DIST_CONFIG_FILE")
    if [ "$EXISTING_COUNT" -gt 0 ]; then
        # Preserve existing associations and add ours
        jq --arg arn "$FUNCTION_ARN" '
            .DefaultCacheBehavior.FunctionAssociations.Items += [{"FunctionARN": $arn, "EventType": "viewer-request"}] |
            .DefaultCacheBehavior.FunctionAssociations.Quantity = (.DefaultCacheBehavior.FunctionAssociations.Items | length)
        ' "$DIST_CONFIG_FILE" > "${DIST_CONFIG_FILE}.new"

        # But check if viewer-request is already taken by another function
        VIEWER_REQ_EXISTS=$(jq -r '.DefaultCacheBehavior.FunctionAssociations.Items[]? | select(.EventType == "viewer-request") | .FunctionARN' "$DIST_CONFIG_FILE" 2>/dev/null || echo "")
        if [ -n "$VIEWER_REQ_EXISTS" ]; then
            # Replace the existing viewer-request function
            jq --arg arn "$FUNCTION_ARN" '
                .DefaultCacheBehavior.FunctionAssociations.Items = [
                    (.DefaultCacheBehavior.FunctionAssociations.Items[] |
                        if .EventType == "viewer-request" then .FunctionARN = $arn else . end)
                ] |
                .DefaultCacheBehavior.FunctionAssociations.Quantity = (.DefaultCacheBehavior.FunctionAssociations.Items | length)
            ' "$DIST_CONFIG_FILE" > "${DIST_CONFIG_FILE}.new"
        fi
    fi

    aws cloudfront update-distribution \
        --id "$DISTRIBUTION_ID" \
        --if-match "$DIST_ETAG" \
        --distribution-config file://"${DIST_CONFIG_FILE}.new" > /dev/null

    rm -f "$DIST_CONFIG_FILE" "${DIST_CONFIG_FILE}.new"
    print_success "Basic auth enabled on ${DOMAIN_NAME}"
    print_status "CloudFront may take a few minutes to propagate"
}

disable_auth() {
    print_status "Disabling basic auth for ${DOMAIN_NAME}..."

    DISTRIBUTION_ID=$(get_distribution_id)
    print_status "CloudFront distribution: ${DISTRIBUTION_ID}"

    # Get current distribution config
    DIST_CONFIG_FILE=$(mktemp)
    DIST_ETAG=$(aws cloudfront get-distribution-config \
        --id "$DISTRIBUTION_ID" \
        --query 'ETag' --output text)

    aws cloudfront get-distribution-config \
        --id "$DISTRIBUTION_ID" \
        --query 'DistributionConfig' > "$DIST_CONFIG_FILE"

    # Get the function ARN to identify which association to remove
    FUNCTION_ARN=$(aws cloudfront describe-function \
        --name "$FUNCTION_NAME" \
        --stage LIVE \
        --query 'FunctionSummary.FunctionMetadata.FunctionARN' --output text 2>/dev/null || echo "")

    if [ -z "$FUNCTION_ARN" ]; then
        print_warning "No basic auth function found"
        rm -f "$DIST_CONFIG_FILE"
        return 0
    fi

    # Remove the auth function association but keep others
    jq --arg arn "$FUNCTION_ARN" '
        .DefaultCacheBehavior.FunctionAssociations.Items = [
            .DefaultCacheBehavior.FunctionAssociations.Items[]? | select(.FunctionARN != $arn)
        ] |
        .DefaultCacheBehavior.FunctionAssociations.Quantity = (.DefaultCacheBehavior.FunctionAssociations.Items | length)
    ' "$DIST_CONFIG_FILE" > "${DIST_CONFIG_FILE}.new"

    aws cloudfront update-distribution \
        --id "$DISTRIBUTION_ID" \
        --if-match "$DIST_ETAG" \
        --distribution-config file://"${DIST_CONFIG_FILE}.new" > /dev/null

    rm -f "$DIST_CONFIG_FILE" "${DIST_CONFIG_FILE}.new"
    print_success "Basic auth disabled on ${DOMAIN_NAME}"
    print_status "CloudFront may take a few minutes to propagate"
}

show_status() {
    print_status "Basic auth status for ${DOMAIN_NAME}:"

    # Check if function exists
    FUNCTION_ARN=$(aws cloudfront describe-function \
        --name "$FUNCTION_NAME" \
        --stage LIVE \
        --query 'FunctionSummary.FunctionMetadata.FunctionARN' --output text 2>/dev/null || echo "")

    if [ -z "$FUNCTION_ARN" ] || [ "$FUNCTION_ARN" = "None" ]; then
        echo "  Function: not created"
        echo "  Status: DISABLED"
        return 0
    fi

    echo "  Function: ${FUNCTION_NAME}"
    echo "  ARN: ${FUNCTION_ARN}"

    # Check if associated with distribution
    DISTRIBUTION_ID=$(get_distribution_id)
    ASSOC=$(aws cloudfront get-distribution-config \
        --id "$DISTRIBUTION_ID" \
        --query "DistributionConfig.DefaultCacheBehavior.FunctionAssociations.Items[?EventType=='viewer-request'].FunctionARN" \
        --output text 2>/dev/null || echo "")

    if [ "$ASSOC" = "$FUNCTION_ARN" ]; then
        echo "  Status: ENABLED (associated with distribution ${DISTRIBUTION_ID})"
    else
        echo "  Status: DISABLED (function exists but not associated)"
    fi
}

show_usage() {
    echo "Usage: $0 {enable|disable|status}"
    echo ""
    echo "Commands:"
    echo "  enable  - Create/update CloudFront Function and associate with distribution"
    echo "  disable - Remove CloudFront Function association from distribution"
    echo "  status  - Show current basic auth status"
    echo ""
    echo "Credentials: stabbot / changeme"
}

case "${1:-}" in
    enable)
        enable_auth
        ;;
    disable)
        disable_auth
        ;;
    status)
        show_status
        ;;
    *)
        show_usage
        exit 1
        ;;
esac

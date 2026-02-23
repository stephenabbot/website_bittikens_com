# Implementation 05: Individual Project Pages — Rewrite + Email Handler Entry
**Depends on:** impl-01 (quick fixes)
**Estimated session:** Medium–Long (2–3 hours for all 8 pages)
**Goal:** Rewrite all 7 existing project content files to a tight 4-section format. Add 1 new content file for the Email Handler project. Move AWS Well-Architected pillars to a collapsible section at the bottom of each page.

---

## Target Format (applies to all project pages)

Each project markdown file should follow this structure:

```
## The Problem
2–3 sentences. What breaks or doesn't work without this project. Frame in enterprise terms where applicable.

## The Approach
2–3 sentences. How the project solves it. Tool/pattern choices and why, briefly.

## The Outcome
2–3 sentences. What it delivers. Concrete and factual — no fabricated metrics.

## Stack

| Technology | Purpose |
|------------|---------|
| ...        | ...     |

**Repository**: [repo-name](https://github.com/stephenabbot/repo-name)

---

<details>
<summary>AWS Well-Architected Alignment</summary>

- **Operational Excellence**: ...
- **Security**: ...
- **Reliability**: ...
- **Performance Efficiency**: ...
- **Cost Optimization**: ...
- **Sustainability**: ...

</details>
```

---

## File 1: `src/content/work/foundation-terraform-bootstrap.md`

Replace body content (keep frontmatter unchanged):

```markdown
## The Problem

Every Terraform project needs remote state storage, state locking, and CI/CD authentication before it can deploy anything. Creating these manually per project is inconsistent and error-prone — and you can't use Terraform to create Terraform's own backend, creating a circular dependency.

## The Approach

CloudFormation manages the bootstrap resources (S3 bucket, DynamoDB lock table, OIDC provider) because it has no dependency on Terraform. SSM Parameter Store publishes the resulting resource identifiers at predictable paths so consuming projects can discover them without hardcoded values.

## The Outcome

A reusable foundation that any subsequent Terraform project can consume immediately. Teams get consistent state management, state locking, and keyless GitHub Actions authentication from a single deployment with no manual setup.

## Stack

| Technology | Purpose |
|------------|---------|
| AWS CloudFormation | Bootstrap orchestration (no Terraform dependency) |
| AWS S3 | Terraform remote state storage with versioning |
| AWS DynamoDB | State locking with point-in-time recovery |
| AWS IAM / OIDC | Keyless GitHub Actions authentication |
| AWS SSM Parameter Store | Resource discovery for consuming projects |

**Repository**: [foundation-terraform-bootstrap](https://github.com/stephenabbot/foundation-terraform-bootstrap)

---

<details>
<summary>AWS Well-Architected Alignment</summary>

- **Operational Excellence**: Infrastructure as code; consistent naming and tagging patterns
- **Security**: OIDC eliminates long-lived credentials; least-privilege IAM roles; encryption at rest
- **Reliability**: S3 versioning; DynamoDB point-in-time recovery; multi-region support
- **Performance Efficiency**: S3 Intelligent Tiering; DynamoDB on-demand billing
- **Cost Optimization**: Shared infrastructure across projects; automated lifecycle policies
- **Sustainability**: Serverless managed services; no idle compute

</details>
```

---

## File 2: `src/content/work/foundation-iam-deploy-roles.md`

Replace body content (keep frontmatter):

```markdown
## The Problem

CI/CD pipelines that deploy to AWS typically use long-lived IAM access keys stored as secrets. These keys don't expire, can't be audited per-deployment, and require rotation procedures that teams frequently defer. One leaked key can compromise an entire AWS account.

## The Approach

Terraform-managed IAM roles configured for GitHub Actions OIDC trust. Each repository gets a scoped role that GitHub Actions can assume via short-lived token exchange — no static credentials stored anywhere. Roles are named and scoped per repository and environment.

## The Outcome

All project deployments in this portfolio use keyless OIDC authentication. Credentials last only for the duration of a workflow run and are never stored, rotated, or leaked.

## Stack

| Technology | Purpose |
|------------|---------|
| AWS IAM | Role definitions and trust policies |
| AWS OIDC | Identity federation for GitHub Actions |
| Terraform | Role provisioning and lifecycle management |
| GitHub Actions | CI/CD consumer of the OIDC roles |
| AWS SSM Parameter Store | Role ARN discovery for consuming workflows |

**Repository**: [foundation-iam-deploy-roles](https://github.com/stephenabbot/foundation-iam-deploy-roles)

---

<details>
<summary>AWS Well-Architected Alignment</summary>

- **Operational Excellence**: Automated role provisioning; consistent naming convention across all projects
- **Security**: No long-lived credentials; short-lived OIDC tokens; least-privilege scoping per repository
- **Reliability**: Role ARNs published to SSM so consuming workflows always resolve current values
- **Performance Efficiency**: No key rotation overhead; zero-latency credential availability
- **Cost Optimization**: No additional cost beyond IAM (free) and SSM parameter reads
- **Sustainability**: Eliminates manual credential management processes

</details>
```

---

## File 3: `src/content/work/service-observability-cloudtrail.md`

Replace body content (keep frontmatter):

```markdown
## The Problem

AWS accounts without CloudTrail enabled have no audit trail for API activity — no record of who changed what, when, or from where. In regulated environments, this is a compliance gap. In incident response, it means investigating blind.

## The Approach

CloudFormation-managed CloudTrail configuration establishes account-level API logging to a dedicated S3 bucket. Log file integrity validation is enabled. The deployment is automated and repeatable so it can be applied consistently across accounts.

## The Outcome

A reliable audit baseline that satisfies compliance requirements and enables post-incident forensics. Deployed as a reusable pattern that can be applied to any AWS account without manual configuration.

## Stack

| Technology | Purpose |
|------------|---------|
| AWS CloudTrail | API activity logging |
| AWS S3 | Log storage with integrity validation |
| AWS CloudFormation | Infrastructure provisioning |
| AWS KMS | Log encryption at rest |

**Repository**: [service-observability-cloudtrail](https://github.com/stephenabbot/service-observability-cloudtrail)

---

<details>
<summary>AWS Well-Architected Alignment</summary>

- **Operational Excellence**: Automated, consistent deployment across accounts; no manual configuration
- **Security**: Full API audit trail; log file integrity validation; encryption at rest via KMS
- **Reliability**: S3 durability (99.999999999%); independent of application infrastructure
- **Performance Efficiency**: Managed service; no compute to maintain
- **Cost Optimization**: S3 Intelligent Tiering on log storage; minimal ongoing cost
- **Sustainability**: No idle compute; managed service footprint

</details>
```

---

## File 4: `src/content/work/service-ephemeral-splunk.md`

Replace body content (keep frontmatter):

```markdown
## The Problem

Log analysis workflows sometimes require a full Splunk instance for complex correlation queries, but a persistent Splunk deployment is expensive to run and maintain when used infrequently. Teams end up either overpaying for idle infrastructure or working around the problem with less capable tools.

## The Approach

Automated infrastructure that deploys a Splunk Enterprise instance on demand and tears it down when the work is done. The deploy/destroy cycle is scripted so the full environment is up in minutes and leaves nothing running when finished.

## The Outcome

Full Splunk capability available on demand at near-zero cost when idle. Useful for incident post-mortems, compliance log reviews, and one-off analysis tasks that don't justify a persistent deployment.

## Stack

| Technology | Purpose |
|------------|---------|
| AWS EC2 | Splunk compute |
| AWS CloudFormation | Instance and networking provisioning |
| Splunk Enterprise | Log analysis and correlation |
| Shell scripting | Deploy/destroy automation |

**Repository**: [service-ephemeral-splunk](https://github.com/stephenabbot/service-ephemeral-splunk)

---

<details>
<summary>AWS Well-Architected Alignment</summary>

- **Operational Excellence**: Scripted deploy/destroy; repeatable process with no manual steps
- **Security**: Instance terminated when not in use; no persistent attack surface
- **Reliability**: Stateless deployment; fresh instance each use eliminates configuration drift
- **Performance Efficiency**: Right-sized only when needed; no idle resource overhead
- **Cost Optimization**: Zero cost when idle; pay only for actual analysis time
- **Sustainability**: Compute exists only during active use

</details>
```

---

## File 5: `src/content/work/mypylogger.md`

Replace body content (keep frontmatter):

```markdown
## The Problem

Python's standard `logging` module has inconsistent defaults and requires boilerplate configuration to produce structured output. Lambda functions and CLI tools often end up with ad-hoc logging that is difficult to parse, search, or correlate across invocations.

## The Approach

A zero-dependency library that wraps Python's logging module with sensible defaults: structured JSON output, consistent field names, and configurable log levels via environment variable. Extracted from production Lambda code and packaged as a reusable library.

## The Outcome

Drop-in structured logging for Python Lambda functions and CLI tools. Consistent JSON output that works with CloudWatch Logs Insights and any log aggregation system without custom parsing rules.

## Stack

| Technology | Purpose |
|------------|---------|
| Python 3.x | Implementation language |
| Python `logging` | Standard library wrapper |
| PyPI | Distribution |

**Repository**: [mypylogger](https://github.com/stephenabbot/mypylogger)

---

<details>
<summary>AWS Well-Architected Alignment</summary>

- **Operational Excellence**: Structured JSON output parseable by CloudWatch Logs Insights
- **Security**: No dependencies; no external network calls; auditable source
- **Reliability**: Zero-dependency design eliminates transitive dependency failures in Lambda
- **Performance Efficiency**: Minimal overhead; no I/O beyond the standard logging handler
- **Cost Optimization**: Structured output reduces CloudWatch query cost vs. unstructured logs
- **Sustainability**: Lightweight; no unnecessary compute

</details>
```

---

## File 6: `src/content/work/professional-website-platform.md`

Replace body content (keep frontmatter, update repo/live site if needed):

```markdown
## The Problem

A professional portfolio site needs to be fast, cheap to host, easy to deploy, and fully under version control — including the infrastructure. Most hosting platforms introduce ongoing cost, vendor lock-in, or a deployment process that requires manual steps.

## The Approach

Astro-based static site with GitHub Actions CI/CD. Deployment uses OIDC authentication (no stored secrets), automated CloudFront cache invalidation, and full infrastructure as code. The entire platform — site, infrastructure, and deploy pipeline — lives in two Git repositories.

## The Outcome

Production hosting at approximately $3/month (S3 + CloudFront + Route53). Deploys automatically on push to main. A clean demonstration that the same practices used at enterprise scale apply to personal infrastructure.

## Stack

| Technology | Purpose |
|------------|---------|
| Astro 5.x | Static site framework |
| GitHub Actions | CI/CD pipeline |
| AWS OIDC | Keyless deploy authentication |
| AWS S3 | Static asset hosting |
| AWS CloudFront | CDN and HTTPS termination |
| AWS Route53 | DNS management |
| Terraform | Infrastructure provisioning |

**Repository**: [website_bittikens_com](https://github.com/stephenabbot/website_bittikens_com)
**Live Site**: [bittikens.com](https://bittikens.com)

---

<details>
<summary>AWS Well-Architected Alignment</summary>

- **Operational Excellence**: Full IaC; automated deploy and invalidation; no manual steps
- **Security**: OIDC keyless auth; no secrets stored in GitHub; CloudFront HTTPS enforcement
- **Reliability**: S3 11-nine durability; CloudFront multi-edge availability
- **Performance Efficiency**: Static generation; global CDN distribution; no server-side compute
- **Cost Optimization**: ~$3/month for production hosting; scales to millions of requests without cost change
- **Sustainability**: No idle compute; serverless architecture

</details>
```

---

## File 7: `src/content/work/website-infrastructure.md`

Replace body content (keep frontmatter):

```markdown
## The Problem

Static website hosting on AWS involves several interdependent resources that must be provisioned in the correct order: S3 bucket, CloudFront distribution, ACM certificate (in us-east-1 regardless of bucket region), and Route53 records. Doing this manually is error-prone and not repeatable across domains.

## The Approach

Terraform modules manage all hosting resources with consistent structure. ACM certificate validation is automated via Route53 DNS records. The same module handles multiple domains (denverbytes.com and bittikens.com) with per-domain configuration.

## The Outcome

Repeatable, version-controlled hosting infrastructure deployable to a new domain in minutes. S3 bucket versioning enables content rollback. CloudFront distribution provides global availability and HTTPS with no additional cost per request.

## Stack

| Technology | Purpose |
|------------|---------|
| Terraform | Infrastructure provisioning |
| AWS S3 | Static content storage with versioning |
| AWS CloudFront | CDN, HTTPS, custom domain |
| AWS ACM | TLS certificate management |
| AWS Route53 | DNS and certificate validation |

**Domains hosted:**
- **bittikens.com** — This website
- **denverbytes.com** — Production website
- **denverbytes.com** → **denverbites.com** — Redirect alias

**Repository**: [website-infrastructure](https://github.com/stephenabbot/website-infrastructure)

---

<details>
<summary>AWS Well-Architected Alignment</summary>

- **Operational Excellence**: Terraform-managed; repeatable across domains; automated certificate validation
- **Security**: S3 public access blocked; CloudFront origin access control; HTTPS enforced
- **Reliability**: S3 versioning for rollback; CloudFront multi-region edge; ACM auto-renewal
- **Performance Efficiency**: Global CDN; no origin compute; efficient static delivery
- **Cost Optimization**: Per-request pricing; no idle cost; shared infrastructure across domains
- **Sustainability**: No servers; minimal resource footprint

</details>
```

---

## File 8 (NEW): `src/content/work/service-email-handler.md`

Create this file:

```markdown
---
title: Service Email Handler
publishDate: 2026-01-15 00:00:00
img: /assets/stock-2.jpg
img_alt: AWS email pipeline with Lambda and DynamoDB
description: |
  AWS-native email pipeline: spam filtering, auto-acknowledgment, reply routing,
  and DynamoDB conversation tracking for structured contact management.
tags:
  - AWS
  - Lambda
  - SES
  - Python
  - DynamoDB
---

## The Problem

A public contact address for job searching needs to handle spam, acknowledge first contact, route replies without exposing a private mailbox, and maintain a searchable record of every conversation. Without automation, this is manual triage on every inbound message.

## The Approach

AWS SES receives inbound email. A Lambda-based pipeline applies three-stage spam filtering (SES verdict flags, recipient validation, PCRE2 pattern matching), auto-acknowledges first contact from each unique sender, and forwards legitimate mail to a private mailbox with thread-aware reply routing via a subdomain. Conversation metadata — sender, company, title, status — is stored in DynamoDB with 8 GSIs for structured querying.

## The Outcome

A public address (`stephen.abbot@denverbytes.com`) that handles spam automatically, acknowledges every first contact, and maintains a searchable record of every job-search conversation without manual tracking. Replies route back to senders via the thread subdomain, keeping the private mailbox address internal.

## Stack

| Technology | Purpose |
|------------|---------|
| AWS SES | Email receipt, DKIM signing, delivery |
| AWS Lambda (Python 3.12) | Inbound handler, reply router, attachment extractor |
| AWS S3 | Email archive, attachments, extracted text |
| AWS DynamoDB | Conversation tracking (8 GSIs) |
| AWS CloudWatch / SNS | Structured logging, error alarms |
| AWS Route53 | MX, SPF, DKIM, DMARC, thread subdomain |
| OpenTofu / Terraform | Full infrastructure as code |

**Repository**: [service-email-handler](https://github.com/stephenabbot/service-email-handler)

---

<details>
<summary>AWS Well-Architected Alignment</summary>

- **Operational Excellence**: Full IaC; automated spam management; structured conversation records
- **Security**: DKIM/SPF/DMARC on all outbound mail; S3 AES256 encryption; least-privilege Lambda roles; private mailbox never exposed to senders
- **Reliability**: SES managed availability; DynamoDB PAY_PER_REQUEST scales to any volume; S3 11-nine durability for archive
- **Performance Efficiency**: Event-driven Lambda; no polling or idle compute
- **Cost Optimization**: Serverless pay-per-use; near-zero cost at job-search email volumes
- **Sustainability**: No idle servers; Lambda invokes only on received mail

</details>
```

---

## Notes on `<details>` Rendering in Astro

Astro's markdown renderer (based on remark) supports native HTML `<details>` and `<summary>` tags inline in markdown. The collapsible section should render correctly without any additional plugins. Test that the `<details>` block renders and toggles properly in the browser after build.

If `<details>` does not render correctly inside the MDX/Markdown pipeline, add a blank line before and after the HTML block.

---

## Acceptance Criteria
- [ ] All 7 existing project pages follow Problem → Approach → Outcome → Stack format
- [ ] Each page has a collapsible `<details>` block at the bottom for AWS pillars (closed by default)
- [ ] New `service-email-handler.md` file exists and renders correctly
- [ ] No fabricated metrics anywhere (no dollar amounts, no specific percentages)
- [ ] All GitHub repository links are verified against actual repo names
- [ ] `img` fields in frontmatter reference existing image assets in `public/assets/`

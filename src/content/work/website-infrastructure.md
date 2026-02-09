---
title: Website Infrastructure
publishDate: 2025-12-05 00:00:00
img: /assets/stock-3.jpg
img_alt: Multi-domain static website hosting with S3, CloudFront, Route53, and ACM integration
description: |
  Multi-domain static website hosting infrastructure with automated SSL certificate 
  management and global content distribution using AWS managed services.
tags:
  - OpenTofu
  - AWS
  - Multi-Domain
  - CDN
---

## Scalable Website Hosting Challenge

Static websites require coordination between multiple AWS services for secure, performant hosting. Manual configuration creates inconsistency, security gaps, and operational overhead when managing multiple domains.

This project provides automated infrastructure deployment for multiple static websites with complete SSL certificate management and global content distribution through AWS managed services.

## Architecture & Implementation

### Multi-Service Orchestration

- **S3 buckets** with versioning, encryption, and public access blocks
- **CloudFront distributions** with Origin Access Control and comprehensive security headers
- **Route53 hosted zones** with A, AAAA, and CNAME records for IPv4/IPv6 and www support
- **ACM certificates** with DNS validation for apex and www subdomains through Route53

### Advanced Features

- **CloudFront Functions** for directory index handling and clean URLs
- **Security headers** via CloudFront Response Headers Policy providing XSS protection, clickjacking prevention, and content security enforcement
- **www subdomain support** ensuring professional website accessibility patterns with automatic SSL certificate coverage for both apex and www domains
- **Cost optimization** through PriceClass_100 covering US and Europe regions
- **Service discovery** via SSM Parameter Store for content projects

### Current Deployments

Successfully hosting multiple domains with consistent infrastructure patterns:

- **bittikens.com** - This website
- **denverbytes.com** - Production website
- **denverbites.com** - redirect to denverbytes.com

## The Scalability Story

This isn't just website hosting - it's **infrastructure that scales with business needs**. The dynamic domain discovery through filesystem scanning means adding new domains requires minimal configuration changes.

### Operational Excellence

- **Automated deployment** through GitHub Actions with OIDC authentication
- **Idempotent operations** supporting multiple executions without conflicts
- **Comprehensive resource tagging** for cost allocation and operational visibility
- **Loose coupling** between infrastructure and content projects

### Performance & Security

- **Global CDN distribution** reducing latency worldwide
- **SSL/TLS certificates** with automatic DNS validation and renewal
- **Origin Access Control** restricting S3 access to CloudFront only
- **Error page handling** redirecting client errors to homepage

This infrastructure demonstrates how to build **enterprise-grade hosting solutions** that are both cost-effective and operationally efficient, serving as a foundation for any organization's web presence.

**Cost-Effective Architecture**: The entire multi-domain hosting infrastructure operates at approximately $3/month total, demonstrating how modern serverless architecture delivers enterprise capabilities at startup-friendly costs.

**Repository**: [website-infrastructure](https://github.com/stephenabbot/website-infrastructure)

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

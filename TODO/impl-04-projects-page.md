# Implementation 04: Projects Page — Table View
**Depends on:** impl-01 (quick fixes), impl-06 (TDT page) and impl-05 (email handler) should be done before this, but the table can be built first with placeholder rows
**Estimated session:** Short–Medium (1 hour)
**Goal:** Replace the card grid work page with a grouped table that lets a scanner see all projects at a glance without scrolling through cards.

---

## Overview

The current `work.astro` uses grouped card grids (3 groups, PortfolioPreview cards). This is replaced with a grouped table layout. Each row: **Project name** (linked) | **One-line description** | **GitHub** | **Status/Notes**.

The Hero tagline changes to reflect the employer-value framing, not generic portfolio language.

---

## Project Inventory (Complete List)

After impl-05 and impl-06, there will be 9 project content files:

| Slug | Display Name | Group |
|------|-------------|-------|
| `tdt-technical-debt-tool` | Technical Debt Tool | Enterprise Tools |
| `service-email-handler` | Email Handler | Enterprise Tools |
| `foundation-terraform-bootstrap` | Terraform Bootstrap | Foundation |
| `foundation-iam-deploy-roles` | IAM Deploy Roles | Foundation |
| `service-observability-cloudtrail` | CloudTrail Observability | Services |
| `service-ephemeral-splunk` | Ephemeral Splunk | Services |
| `mypylogger` | Python Logger (mypylogger) | Tools |
| `professional-website-platform` | Website Platform | Website |
| `website-infrastructure` | Website Infrastructure | Website |

---

## Rewrite `src/pages/work.astro`

Replace the entire file:

```astro
---
import ContactCTA from "../components/ContactCTA.astro";
import Hero from "../components/Hero.astro";
import BaseLayout from "../layouts/BaseLayout.astro";
import Icon from "../components/Icon.astro";
---

<BaseLayout
	title="Projects | Stephen Abbot"
	description="AWS infrastructure projects spanning enterprise tooling, foundation infrastructure, observability services, and platform engineering. Each project is live, documented, and publicly available."
>
	<div class="stack gap-20">
		<main class="wrapper stack gap-12">
			<Hero
				title="Projects"
				tagline="Live, documented infrastructure. Each project solves a real problem — the same class of problems that appear in enterprise AWS environments at scale."
				align="start"
			/>

			<!-- Enterprise Tools -->
			<section class="project-group">
				<h2 class="group-title">Enterprise Tools</h2>
				<p class="group-desc">
					Projects addressing problems at organizational scale: multi-account visibility,
					cost analysis, security findings, and operational workflows.
				</p>
				<table class="project-table">
					<thead>
						<tr>
							<th>Project</th>
							<th>Description</th>
							<th class="col-links">Links</th>
						</tr>
					</thead>
					<tbody>
						<tr class="featured-row">
							<td class="project-name">
								<a href="/work/tdt-technical-debt-tool/">Technical Debt Tool</a>
								<span class="badge">Flagship</span>
							</td>
							<td class="project-desc">
								Programmatic analysis platform scanning AWS accounts for phantom resources,
								security misconfigurations, IAM overprovisioning, and cost waste.
								Deployed across 40+ accounts in an 800+ account enterprise org.
							</td>
							<td class="project-links-cell">
								<a href="/work/tdt-technical-debt-tool/" class="btn-link">Case Study</a>
							</td>
						</tr>
						<tr>
							<td class="project-name">
								<a href="/work/service-email-handler/">Email Handler</a>
							</td>
							<td class="project-desc">
								AWS-native email pipeline: SES receipt, Lambda-based spam filtering,
								auto-acknowledgment, reply routing, and DynamoDB conversation tracking
								for structured job-search contact management.
							</td>
							<td class="project-links-cell">
								<a href="/work/service-email-handler/" class="btn-link">Details</a>
								<a href="https://github.com/stephenabbot/service-email-handler" target="_blank" rel="noopener" class="btn-link btn-link--ghost">
									<Icon icon="github-logo" size="1em" /> GitHub
								</a>
							</td>
						</tr>
					</tbody>
				</table>
			</section>

			<!-- Foundation Infrastructure -->
			<section class="project-group">
				<h2 class="group-title">Foundation Infrastructure</h2>
				<p class="group-desc">
					Reusable infrastructure primitives that solve the bootstrap problem:
					how do you create Terraform state storage before Terraform exists,
					and how do you deploy securely without long-lived credentials?
				</p>
				<table class="project-table">
					<thead>
						<tr>
							<th>Project</th>
							<th>Description</th>
							<th class="col-links">Links</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="project-name">
								<a href="/work/foundation-terraform-bootstrap/">Terraform Bootstrap</a>
							</td>
							<td class="project-desc">
								CloudFormation-managed S3 state bucket, DynamoDB lock table, and OIDC
								provider. Solves the circular dependency of managing Terraform's own
								backend with Terraform.
							</td>
							<td class="project-links-cell">
								<a href="/work/foundation-terraform-bootstrap/" class="btn-link">Details</a>
								<a href="https://github.com/stephenabbot/foundation-terraform-bootstrap" target="_blank" rel="noopener" class="btn-link btn-link--ghost">
									<Icon icon="github-logo" size="1em" /> GitHub
								</a>
							</td>
						</tr>
						<tr>
							<td class="project-name">
								<a href="/work/foundation-iam-deploy-roles/">IAM Deploy Roles</a>
							</td>
							<td class="project-desc">
								Terraform-managed IAM roles for GitHub Actions OIDC authentication.
								Eliminates static credentials from CI/CD pipelines using short-lived
								tokens scoped per repository and environment.
							</td>
							<td class="project-links-cell">
								<a href="/work/foundation-iam-deploy-roles/" class="btn-link">Details</a>
								<a href="https://github.com/stephenabbot/foundation-iam-deploy-roles" target="_blank" rel="noopener" class="btn-link btn-link--ghost">
									<Icon icon="github-logo" size="1em" /> GitHub
								</a>
							</td>
						</tr>
					</tbody>
				</table>
			</section>

			<!-- Services -->
			<section class="project-group">
				<h2 class="group-title">Services & Tools</h2>
				<p class="group-desc">
					Specialized services and utilities: observability infrastructure,
					ephemeral compute, and Python tooling.
				</p>
				<table class="project-table">
					<thead>
						<tr>
							<th>Project</th>
							<th>Description</th>
							<th class="col-links">Links</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="project-name">
								<a href="/work/service-observability-cloudtrail/">CloudTrail Observability</a>
							</td>
							<td class="project-desc">
								CloudFormation infrastructure for centralized AWS audit logging.
								Establishes account-level event visibility as a compliance and
								forensic baseline.
							</td>
							<td class="project-links-cell">
								<a href="/work/service-observability-cloudtrail/" class="btn-link">Details</a>
								<a href="https://github.com/stephenabbot/service-observability-cloudtrail" target="_blank" rel="noopener" class="btn-link btn-link--ghost">
									<Icon icon="github-logo" size="1em" /> GitHub
								</a>
							</td>
						</tr>
						<tr>
							<td class="project-name">
								<a href="/work/service-ephemeral-splunk/">Ephemeral Splunk</a>
							</td>
							<td class="project-desc">
								Automated infrastructure for deploying and destroying Splunk Enterprise
								instances on demand. Purpose-built for log analysis workflows that do
								not justify a persistent deployment.
							</td>
							<td class="project-links-cell">
								<a href="/work/service-ephemeral-splunk/" class="btn-link">Details</a>
								<a href="https://github.com/stephenabbot/service-ephemeral-splunk" target="_blank" rel="noopener" class="btn-link btn-link--ghost">
									<Icon icon="github-logo" size="1em" /> GitHub
								</a>
							</td>
						</tr>
						<tr>
							<td class="project-name">
								<a href="/work/mypylogger/">mypylogger</a>
							</td>
							<td class="project-desc">
								Zero-dependency Python logging library with clean JSON output and
								sensible defaults. Extracted from production Lambda code to be
								reusable across projects.
							</td>
							<td class="project-links-cell">
								<a href="/work/mypylogger/" class="btn-link">Details</a>
								<a href="https://github.com/stephenabbot/mypylogger" target="_blank" rel="noopener" class="btn-link btn-link--ghost">
									<Icon icon="github-logo" size="1em" /> GitHub
								</a>
							</td>
						</tr>
					</tbody>
				</table>
			</section>

			<!-- Website Platform -->
			<section class="project-group">
				<h2 class="group-title">Website Platform</h2>
				<p class="group-desc">
					The infrastructure and application behind this site.
					Production hosting at ~$3/month using S3, CloudFront, and Route53.
				</p>
				<table class="project-table">
					<thead>
						<tr>
							<th>Project</th>
							<th>Description</th>
							<th class="col-links">Links</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="project-name">
								<a href="/work/professional-website-platform/">Website Platform</a>
							</td>
							<td class="project-desc">
								Astro-based professional website with GitHub Actions CI/CD, OIDC
								deploy authentication, automated CloudFront invalidation, and
								full infrastructure as code.
							</td>
							<td class="project-links-cell">
								<a href="/work/professional-website-platform/" class="btn-link">Details</a>
								<a href="https://github.com/stephenabbot/website_bittikens_com" target="_blank" rel="noopener" class="btn-link btn-link--ghost">
									<Icon icon="github-logo" size="1em" /> GitHub
								</a>
							</td>
						</tr>
						<tr>
							<td class="project-name">
								<a href="/work/website-infrastructure/">Website Infrastructure</a>
							</td>
							<td class="project-desc">
								Multi-domain static hosting infrastructure: S3 with versioning,
								CloudFront distribution, ACM certificate, and Route53 DNS.
								Terraform-managed with automated deploy pipeline.
							</td>
							<td class="project-links-cell">
								<a href="/work/website-infrastructure/" class="btn-link">Details</a>
								<a href="https://github.com/stephenabbot/website-infrastructure" target="_blank" rel="noopener" class="btn-link btn-link--ghost">
									<Icon icon="github-logo" size="1em" /> GitHub
								</a>
							</td>
						</tr>
					</tbody>
				</table>
			</section>

		</main>
		<ContactCTA />
	</div>
</BaseLayout>

<style>
	.project-group {
		display: flex;
		flex-direction: column;
		gap: 1rem;
	}

	.group-title {
		font-size: var(--text-2xl);
		color: var(--gray-0);
	}

	.group-desc {
		font-size: var(--text-md);
		color: var(--gray-400);
		line-height: 1.6;
		max-width: 65ch;
	}

	.project-table {
		width: 100%;
		border-collapse: collapse;
		font-size: var(--text-sm);
	}

	.project-table thead th {
		text-align: left;
		padding: 0.5rem 0.75rem;
		color: var(--gray-500);
		font-weight: 500;
		border-bottom: 1px solid var(--gray-800);
		font-size: var(--text-xs, 0.75rem);
		text-transform: uppercase;
		letter-spacing: 0.06em;
	}

	.project-table tbody tr {
		border-bottom: 1px solid var(--gray-800);
		transition: background-color var(--theme-transition);
	}

	.project-table tbody tr:last-child {
		border-bottom: none;
	}

	.project-table tbody tr:hover {
		background-color: var(--accent-subtle-overlay);
	}

	.project-table td {
		padding: 0.875rem 0.75rem;
		vertical-align: top;
	}

	.project-name {
		white-space: nowrap;
		width: 14rem;
	}

	.project-name a {
		color: var(--gray-0);
		text-decoration: none;
		font-weight: 500;
	}

	.project-name a:hover {
		color: var(--accent-regular);
	}

	.badge {
		display: inline-block;
		margin-left: 0.5rem;
		padding: 0.1rem 0.5rem;
		background: var(--accent-regular);
		color: var(--accent-text-over);
		border-radius: 999rem;
		font-size: 0.65rem;
		font-weight: 600;
		text-transform: uppercase;
		letter-spacing: 0.06em;
		vertical-align: middle;
	}

	.featured-row {
		background: var(--gradient-subtle);
	}

	.project-desc {
		color: var(--gray-300);
		line-height: 1.5;
	}

	.col-links {
		width: 10rem;
	}

	.project-links-cell {
		display: flex;
		flex-direction: column;
		gap: 0.375rem;
		align-items: flex-start;
	}

	.btn-link {
		display: inline-flex;
		align-items: center;
		gap: 0.25rem;
		padding: 0.25rem 0.625rem;
		border-radius: 999rem;
		font-size: var(--text-xs, 0.75rem);
		font-weight: 500;
		text-decoration: none;
		background: var(--accent-regular);
		color: var(--accent-text-over);
		white-space: nowrap;
		transition: opacity var(--theme-transition);
	}

	.btn-link:hover {
		opacity: 0.85;
	}

	.btn-link--ghost {
		background: transparent;
		border: 1px solid var(--gray-700);
		color: var(--gray-300);
	}

	.btn-link--ghost:hover {
		border-color: var(--accent-dark);
		color: var(--gray-100);
		opacity: 1;
	}

	/* On small screens, hide description column to keep table readable */
	@media (max-width: 49.9em) {
		.project-desc {
			display: none;
		}
		.project-name {
			width: auto;
		}
		.col-links {
			width: auto;
		}
		.project-links-cell {
			flex-direction: row;
			flex-wrap: wrap;
		}
	}

	@media (min-width: 50em) {
		.group-title {
			font-size: var(--text-3xl);
		}
	}
</style>
```

---

## Notes
- The GitHub URLs for `service-ephemeral-splunk`, `website-infrastructure`, and others should be verified against actual repo names on `stephenabbot`'s GitHub before publishing
- TDT row has no GitHub link (employer IP — narrative only)
- The `<PortfolioPreview>` component is no longer used on this page; it can remain in the codebase (it may still be used on the homepage)
- Mobile view hides the description column — project name + links still scannable

---

## Acceptance Criteria
- [ ] Page shows 4 grouped tables: Enterprise Tools | Foundation | Services & Tools | Website Platform
- [ ] TDT row appears first with "Flagship" badge and links to `/work/tdt-technical-debt-tool/`
- [ ] Email Handler row present
- [ ] All existing 7 projects present with accurate one-line descriptions
- [ ] GitHub links open in new tab
- [ ] Mobile view is still scannable (hides description, shows name + links)
- [ ] No card grid or `PortfolioPreview` components on this page

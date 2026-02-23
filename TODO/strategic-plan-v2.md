# Strategic Planning Document: Professional Presence Refactor

**Author:** Claude Opus 4.6 (Strategic Planning Agent)  
**Subject:** Stephen Abbot — Website, Resume, LinkedIn Unified Strategy  
**Date:** 2026-02-10  
**Status:** Draft v2 — Updated with Stephen's input

---

## 1. Strategic Context

### 1.1 The Problem

Stephen Abbot is a 20+ year infrastructure engineer with deep AWS expertise, enterprise-scale experience (800+ account org, Fortune 23 healthcare, 200+ engineering teams), and a demonstrated ability to identify and solve systemic technical debt. His professional presence — website (denverbytes.com), resume, and LinkedIn — does not communicate this effectively.

Three independent assessments of the website confirm consensus: the substance is strong, the packaging undersells it.

### 1.2 The Market Reality

Two structural filters are blocking viable opportunities:

**Filter 1 — Budget-constrained startups:** Vision-aligned companies (AI-native, high-growth) that want senior talent at mid-level rates ($100-150K). These represent the right culture fit but cannot meet compensation requirements (~$210K total package minimum, with flexibility for compelling equity).

**Filter 2 — Checkbox enterprises:** Larger companies screening on certification counts, leetcode scores, and keyword matching rather than architectural judgment and systems thinking. These have budget but wrong evaluation criteria.

### 1.3 The Dual Objective

The professional presence must:

1. **Lead with proven enterprise value** (governance at scale, cost optimization, platform engineering) to secure viable "meat and potatoes" opportunities at appropriate compensation
2. **Signal depth of thinking** (systems philosophy, architectural judgment, learning velocity) to attract frontier opportunities (complex systems, AI-native solutions, hard problems) — the aspirational target

### 1.4 The Unified Narrative

All three platforms (website, resume, LinkedIn) must tell the same story:

> "I find what's broken in cloud infrastructure at enterprise scale, build tools to make it visible, and design solutions that are defensible, cost-efficient, and operationally transparent. I do this faster than expected because I use AI as a force multiplier for 20+ years of systems thinking — not as a shortcut."

---

## 2. Flagship Project: The Technical Debt Tool (TDT)

### 2.1 Why TDT is the Centerpiece

Neither assessment identified TDT as the signature project. This is the critical blind spot. TDT is the single most compelling artifact in Stephen's portfolio because it:

- Solves a real enterprise problem (resource waste, security gaps, compliance drift across 800+ AWS accounts)
- Was built by one person, in a language he learned while building it (Python)
- Produced measurable business outcomes (cost savings, security findings, compliance visibility)
- Demonstrates the exact skills a hiring manager wants: seeing a systemic problem, designing a solution, building it, and delivering value
- Is being rebuilt — showing conviction, not abandonment

### 2.2 IP Constraint

The TDT v1 codebase is 100% employer intellectual property. It cannot be referenced, linked, or shared — even partially. This means:

- The project page must be **narrative-only**: problem, approach, outcomes, lessons, v2 vision
- No code samples, no repo links until the personal rebuild (v2) exists in Stephen's own repo
- The rebuild itself becomes part of the story: "built v1, learned what's wrong, designing v2 with those lessons"
- This constraint actually strengthens the narrative — it demonstrates the ability to articulate architectural thinking without leaning on code as a crutch

### 2.3 TDT Narrative Framework

**For recruiters (10-second version):**  
Built a platform that scans AWS accounts for cost waste, security gaps, and compliance drift. Deployed across 40+ accounts in an 800+ account enterprise org.

**For hiring managers (60-second version):**  
In a Fortune 23 healthcare company with 800+ AWS accounts and 200+ engineering teams, most teams lacked the expertise to evaluate whether their infrastructure was cost-efficient, secure, or compliant. No centralized visibility existed. I designed and built a Python/PostgreSQL platform that programmatically analyzes AWS account configurations — identifying phantom resources, orphaned infrastructure, security misconfigurations, IAM overprovisioning, and cost optimization opportunities. Deployed across 40+ accounts. Currently rebuilding with architectural improvements informed by v1 lessons.

**For engineers (deep-dive, layered approach):**  
Available via the dedicated project page with two tiers:
- **Summary tier** (visible immediately): Problem, approach, outcomes, v2 direction — targets hiring managers and recruiters
- **Deep-dive tier** (expandable or linked): Architecture decisions, trade-offs, what v1 got right and wrong, design patterns, v2 technical roadmap — targets engineers and technical evaluators

### 2.4 TDT Positioning on Each Platform

| Platform | Treatment |
|----------|-----------|
| **Website homepage** | Featured as flagship project with metrics and business context |
| **Website project page** | Dedicated layered deep-dive: summary tier + expandable technical tier (narrative-only, no code until v2 repo exists) |
| **Resume** | Lead bullet under current role with quantified outcomes |
| **LinkedIn headline/about** | Referenced as signature achievement |

---

## 3. Messaging Framework

### 3.1 Identity Statement

**Current:** "Site Reliability Engineer and Cloud Architect specializing in AWS infrastructure, automation, and observability"

**Proposed:** "Infrastructure platform engineer who finds what's broken at enterprise scale and builds tools to fix it. 20+ years. AWS-native. AI-augmented."

This statement:
- Leads with action and outcome, not title
- Signals scale
- Positions AI correctly (augmentation, not replacement)
- Is specific enough to differentiate, broad enough to not exclude

### 3.2 AI Positioning

AI-augmented engineering is a **supporting detail, not the headline**. The website demonstrates it implicitly:

- Built entire platform (4 infrastructure projects, website, blog, architecture docs) in 3 months, solo
- TDT built in Python without prior Python experience
- The quality and scope of output speaks for itself

Explicit framing (for About page or blog): "AI is a force multiplier for existing expertise. It amplifies judgment — it doesn't replace it. Engineers who understand system design can use AI to operate at a scope that previously required a team. Engineers who don't understand system design get faster at building the wrong thing."

This positions Stephen as someone who *understands* what AI actually is, in contrast to both the hype and the skepticism. It's a differentiator for the AI-startup audience.

### 3.3 Compensation Signaling (Indirect)

The website should never state a number. Instead, signal seniority through:

- Scale language: "800+ accounts," "Fortune 23," "200+ teams"
- Decision language: "designed," "architected," "led"
- Tenure: "20+ years" visible on homepage
- Depth: Architecture page demonstrates staff/principal-level thinking

A hiring manager who reads the Architecture page will not offer $120K.

---

## 4. Website Strategy

### 4.1 Information Architecture (Revised)

**Current nav:** Home | Work | Architecture | Experience | Technologies | Blog | Resume | About (8 items)

**Proposed nav:** Home | Flagship Project | Architecture | Experience | Blog | Resume (6 items)

Changes:
- **Work → Flagship Project**: TDT gets its own page; supporting projects (Terraform Bootstrap, IAM Deploy, Website Infra) become subsections or secondary listings
- **Technologies**: Merge into Resume or About (competency matrix is useful but not worth a nav slot)
- **About**: Accessible from footer or homepage section, not primary nav

### 4.2 Homepage Redesign — Content Blocks

The homepage is the only page that matters for first contact. Proposed structure:

**Block 1 — Hero (0-5 seconds)**
- Revised identity statement (§3.1)
- Years of experience, scale indicators
- Role pills visible on mobile (fix current `display: none` bug)

**Block 2 — Flagship Project Summary (5-15 seconds)**
- TDT: one paragraph, 3-4 metrics, link to deep-dive
- This is the "why should I keep reading" answer

**Block 3 — Enterprise Context (15-30 seconds)**
- 3-4 metrics: accounts managed, teams enabled, org scale
- Presented as facts, not boasts

**Block 4 — Recent Insights (30-60 seconds)**
- 2-3 blog post excerpts with pull quotes
- Demonstrates ongoing thought leadership

**Block 5 — Supporting Projects (60+ seconds)**
- Infrastructure projects with business context framing
- Each card: Problem → Solution → Impact

**Block 6 — CTA**
- "Let's discuss your infrastructure challenges"
- Professional email at stabbot@denverbytes.com (email hosting project in progress — prioritized for completion)
- LinkedIn and GitHub links

### 4.3 TDT Project Page (New — Narrative Only, Layered)

**Summary Tier (visible on load):**

1. **The Problem** — Why this tool needed to exist (2-3 paragraphs, enterprise context)
2. **The Approach** — High-level design philosophy and architecture overview
3. **The Outcomes** — Quantified findings and business impact
4. **V2 Direction** — What the rebuild addresses and why

**Deep-Dive Tier (expandable sections or linked sub-pages):**

5. **Design Decisions & Trade-offs** — Why Python, why PostgreSQL, what patterns were used and why
6. **Honest Assessment** — What v1 got right, what it got wrong (signals maturity, not weakness)
7. **V2 Technical Roadmap** — Architecture improvements, language considerations, modularity goals
8. **Technologies** — Stack with rationale for each choice

Note: No code links until v2 personal repo exists. The narrative itself must demonstrate architectural thinking.

### 4.4 Items Both Assessments Agree On (Execute Immediately)

| Item | Priority | Effort |
|------|----------|--------|
| Rewrite homepage hero | Critical | Low |
| Fix role pills mobile visibility | Critical | Trivial |
| Fix "LinkeIn" typo | Critical | Trivial |
| Replace CTA text and email | Critical | Low |
| Fix 404 page with navigation links | High | Low |
| Add enterprise context to project cards | High | Medium |
| Surface experience highlights on homepage | High | Medium |
| Trim pre-2015 resume entries | Medium | Low |

---

## 5. Resume Strategy

### 5.1 Current Issues

- TDT is not the lead item
- Entry-level certifications (Cloud Practitioner, AI Practitioner) are prominent while missing associate/professional certs
- Pre-2015 roles have thin descriptions that dilute senior positioning
- Formatting inconsistencies ("POC" vs "PoC", redundant labels)

### 5.2 Restructure

**Lead with TDT** under current role:
- First bullet: TDT with quantified outcomes
- Remaining bullets: governance, alarming, team enablement work

**Certifications**: Keep what you have. Do not hide them — the honest self-assessment on the Technologies page already handles the "why no SA Pro" question implicitly. If pursuing SA Associate, note "In Progress."

**Pre-2015 roles**: Consolidate to company, title, dates, and one sentence each. The 2015+ work carries the weight.

**Format**: Ensure both downloadable PDF and DOCX are available from the resume page. PDF for mobile/browser viewing, DOCX for ATS systems and recruiters who need editable format.

### 5.3 Resume ↔ Website Alignment

Every claim on the resume should have a corresponding deep-dive available on the website. The resume is the summary; the website is the evidence. Add a line to the resume header: "Portfolio & Architecture Details: denverbytes.com"

---

## 6. LinkedIn Strategy

### 6.1 Headline

**Current** (assumed generic): Update to match identity statement.

**Proposed:** "Infrastructure Platform Engineer | Enterprise AWS Governance & Cost Optimization | 20+ Years | AI-Augmented"

### 6.2 About Section

Mirror the 60-second TDT narrative (§2.2) plus the AI positioning statement (§3.2). End with: "Portfolio and architecture details at denverbytes.com."

### 6.3 Experience

Ensure current role leads with TDT. Match resume restructure (§5.2).

### 6.4 Featured Section

Link to:
1. Architecture page (denverbytes.com/architecture)
2. "Deployed Code Trumps Claims" blog post
3. TDT project page (once built)

---

## 7. Execution Plan

### Phase 1 — Foundation (Week 1)

Priority: Changes that fix the "first 5 seconds" problem.

| Task | Agent | Directive |
|------|-------|-----------|
| Rewrite homepage hero | Website agent | Use identity statement from §3.1, include years + scale |
| Fix mobile role pills | Website agent | Remove `display: none` from `.roles` |
| Fix "LinkeIn" typo | Website agent | Nav.astro line 30 |
| Replace CTA | Website agent | New text per §4.2 Block 6, professional email |
| Fix 404 page | Website agent | Add links to Home, Architecture, Experience, Resume |
| Rewrite resume lead bullets | Resume agent | TDT first, quantified, per §5.2 |

### Phase 2 — Flagship (Week 2-3)

Priority: TDT as centerpiece.

| Task | Agent | Directive |
|------|-------|-----------|
| Create TDT project page | Website agent | Structure per §4.3 |
| Redesign homepage project section | Website agent | TDT featured, supporting projects reframed with business context |
| Add enterprise metrics to homepage | Website agent | Per §4.2 Block 3 |
| Add blog showcase to homepage | Website agent | Per §4.2 Block 4 |
| Update LinkedIn headline + about | LinkedIn agent | Per §6.1, §6.2 |
| Update LinkedIn experience | LinkedIn agent | Match resume per §6.3 |


### Phase 3 -- Content Infrastructure (Week 3-4)

| Task | Agent | Directive |
|------|-------|-----------|
| Add RSS feed via `@astrojs/rss` | Website agent | Enable subscription/following from the blog; include in blog page header and footer |
| Add RSS autodiscovery `<link>` tag | Website agent | Add to `MainHead.astro` so feed readers auto-detect the feed |
| Add both PDF and DOCX download links to resume page | Website agent | Per SS11 |
| Add aspirational statement | Website agent | Per SS10, About page |
| Consolidate pre-2015 resume entries | Resume agent | Per SS5.2 |
| Reduce nav to 6 items | Website agent | Per SS4.1 |
| LinkedIn featured section | LinkedIn agent | Per SS6.4 |

### Phase 4 -- Content Pipeline (Week 4+, Ongoing)

| Task | Agent | Directive |
|------|-------|-----------|
| Publish first new blog post | Stephen | Select from Blog Topic Backlog document; target 500-800 words for field notes |
| Cross-post to LinkedIn with hook | Stephen | Summary + "Read more at denverbytes.com/blog/[slug]" |
| Weekly cadence established | Stephen | 1 post per week; mix of field notes and essays |
| Cross-platform consistency audit | This agent | Verify unified narrative across all three platforms |

---

## 8. Directives for Executing Agents

Each executing agent should receive:

1. This document (full context)
2. The relevant assessment(s) for their domain
3. A specific phase task list with acceptance criteria
4. The constraint: **do not invent metrics or claims** -- use only what Stephen has confirmed or can confirm

### 8.1 Key Constraint: Metrics

Several recommendations reference specific dollar amounts for cost savings. Stephen will provide additional metrics. Placeholder language should be used ("significant cost savings identified" or "$XX,XXX+") until Stephen provides actuals. Do not fabricate.

### 8.2 Key Constraint: Email

Both assessments flag the hotmail address. Stephen has a separate project in progress to enable email hosting on denverbytes.com. This should be prioritized for completion before Phase 1 CTA changes go live. The CTA can use placeholder text ("Professional inquiries: [coming soon]") if the email project is not complete by Phase 1 execution.

### 8.3 Key Constraint: Tone

The website should read as confident and factual -- not salesy. Stephen's "show don't tell" philosophy is the brand. Every claim should be backed by a link to code, architecture, or evidence. No superlatives without substance.

### 8.4 Key Constraint: Employer Visibility

Stephen's manager and Centene peers are on LinkedIn. Changes across all platforms should not flag him as actively job-seeking. The aspirational statement (SS10) uses professional development language, not departure language. All changes should be frameable as "improving my professional presence" rather than "looking for a new job."

### 8.5 Key Constraint: TDT IP

TDT v1 codebase is 100% employer IP. No code samples, repo links, or direct references to proprietary implementation details. All TDT content must be narrative -- describing patterns, approach, and outcomes without exposing protected work product.

---

## 9. Blog & Content Strategy

### 9.1 Infrastructure Requirements

**RSS Feed:**
- Implement via `@astrojs/rss` package (native Astro support, low effort)
- Add RSS autodiscovery tag to `MainHead.astro`: `<link rel="alternate" type="application/rss+xml" title="Denver Bytes" href="/rss.xml" />`
- Include visible RSS link on blog page (icon + "Subscribe via RSS")
- This enables followers without requiring a custom subscription system

**Future consideration:** Email subscription (e.g., Buttondown, ConvertKit free tier) for readers who don't use RSS. Not required for Phase 3 but worth noting for later.

### 9.2 Content Pipeline

**Cadence:** Weekly. Sustainable only with a mix of formats:

| Format | Length | Effort | Frequency |
|--------|--------|--------|-----------|
| **Field Notes** | 500-800 words | Low (1-2 hours) | 3x/month |
| **Essays** | 1500-2500 words | Medium (4-6 hours) | 1x/month |

**Content principle:** Every post must offer novel insight drawn from direct experience -- not repackaged common knowledge already broadly available. The value is Stephen's perspective from inside an 800+ account enterprise org, which most readers don't have.

**LinkedIn cross-posting strategy:**
- Publish full post on denverbytes.com
- Post summary/hook on LinkedIn (3-5 sentences) with link to full article
- This drives traffic to the website while building LinkedIn visibility
- LinkedIn post should end with a question or observation that invites engagement

**Topic backlog:** Maintained in a separate document (see Blog Topic Backlog). Always 10+ topics queued. Reviewed and refreshed periodically.

### 9.3 Content Categories

| Category | Description | Example |
|----------|-------------|---------|
| **Field Notes** | Short observations from enterprise AWS work | "Why your CloudWatch alarms are lying to you" |
| **Pattern Recognition** | Recurring failures and anti-patterns observed across teams | "The inheritance problem: what happens when teams adopt infrastructure they don't understand" |
| **Philosophy** | Systems thinking, measurement, organizational behavior | Extends existing McNamara Fallacy / Peter Senge threads |
| **Tool Craft** | AI-augmented engineering, Terraform patterns, IaC lessons | "What I learned building a production tool in a language I didn't know" |
| **Architecture Decisions** | Trade-off analysis, design rationale | "Why I chose PostgreSQL over DynamoDB for account-level analytics" |

---

## 10. Aspirational Statement

### 10.1 Purpose

Signal to frontier-opportunity employers that Stephen is interested in more than "meat and potatoes" work, without flagging to current employer as actively job-seeking.

### 10.2 Placement

About page -- framed as professional interests and growth direction, not as a job search statement.

### 10.3 Draft Language

> "The infrastructure work I've done -- governance at scale, cost optimization, technical debt analysis -- is foundational. It solves real problems and I'm good at it. But what I find most compelling is the frontier: complex adaptive systems, AI-native architectures solving hard problems, dynamic systems where the infrastructure itself must be intelligent. I'm drawn to teams building things that don't have playbooks yet."

This reads as a professional aspiration, not a resignation letter. Safe for LinkedIn visibility.

---

## 11. Resume Download Strategy

### 11.1 Requirements

The resume page must offer both formats:

| Format | Purpose | Implementation |
|--------|---------|----------------|
| **PDF** | Mobile viewing, browser preview, universal compatibility | Generated from source (markdown to PDF via build pipeline or maintained as static asset) |
| **DOCX** | ATS parsing, recruiter editing/forwarding | Maintained as static asset or generated from source |

### 11.2 Implementation

- Add two download buttons/links to the resume page: "Download PDF" and "Download DOCX"
- Both files should be kept in sync with the resume markdown content
- Consider automating generation from the markdown source during build (pandoc can handle both conversions)
- Files served from `/public/resume/` or generated to `/dist/resume/` during build

---

## 12. Open Questions (Updated)

### Resolved
- ~~**TDT codebase**~~: 100% employer IP. Project page is narrative-only. V2 will be personal repo.
- ~~**Professional email**~~: denverbytes.com email hosting project in progress, will be prioritized.
- ~~**Aspirational statement**~~: Yes, will include. Low risk given LinkedIn visibility assessment.
- ~~**Blog cadence**~~: Weekly target. Mix of field notes and essays. Original content only.

### Remaining
1. **TDT metrics**: Stephen will provide additional detail. Specific numbers needed: cost savings identified, number of findings/issues surfaced, security gaps found, accounts analyzed. Even ranges are useful.

2. **Additional context**: Stephen indicated more information to share beyond what has been provided. This document will be updated as that context arrives.

---

*End of document. v2 -- Updated with Stephen's input on IP constraints, email project, aspirational statement, blog strategy, RSS requirements, and resume download formats.*

# Implementation 03: Homepage / Hero Rewrite
**Depends on:** impl-01 (quick fixes done), impl-02 (nav done — homepage links to /work/ which will be Projects)
**Estimated session:** Medium (1–2 hours)
**Goal:** Transform the homepage from a generic introduction into a compelling first impression that passes the 5-second hook test for recruiters, hiring managers, and senior engineers.

---

## Guiding Principles

- Lead with outcomes and scale, not job title
- Every claim must be true and verifiable — no fabricated metrics
- "Show don't tell": the homepage is the map; the Architecture and project pages are the evidence
- AI is a supporting detail, not the headline
- No dollar figures for TDT cost savings (not confirmed)

---

## Confirmed Metrics (Safe to Use)

| Metric | Value |
|--------|-------|
| Years of experience | 20+ |
| AWS org size | 800+ accounts |
| Teams enabled | 200+ engineering teams |
| Accounts audited (TDT) | 40+ |
| Infrastructure cost (this website) | ~$3/month |
| Employer type | Fortune 23 healthcare company |
| Website build time | 3 months (full platform) |

---

## Changes to `src/pages/index.astro`

This is a significant rewrite of the page content. The layout infrastructure (BaseLayout, imports, CSS variables) stays the same. Replace the `<BaseLayout>` content block.

### New page title and description (frontmatter/props)

```astro
<BaseLayout
	title="Stephen Abbot: Infrastructure Platform Engineer | AWS at Enterprise Scale"
	description="20+ years building AWS infrastructure at enterprise scale. SRE specializing in governance, cost optimization, and technical debt analysis across 800+ account organizations."
>
```

### Section 1: Hero (replace existing `<header class="hero">` block)

Keep the existing `<Hero>` component and `<Image>` portrait. Change the `title` and `tagline` props:

```astro
<Hero
	title="Hello, I'm Stephen Abbot"
	tagline="Infrastructure platform engineer. I find what's broken at enterprise scale, build tools to make it visible, and design solutions that are defensible, cost-efficient, and operationally transparent."
	align="start"
>
```

The role pills stay as-is (SRE / Cloud Architect / Mentor) — just now visible on mobile thanks to impl-01.

Add a credibility bar **below** the Hero, before `<Skills />`:

```astro
<div class="credibility-bar">
	<div class="cred-item">
		<span class="cred-number">20+</span>
		<span class="cred-label">Years in Infrastructure</span>
	</div>
	<div class="cred-item">
		<span class="cred-number">800+</span>
		<span class="cred-label">AWS Accounts (Org Scale)</span>
	</div>
	<div class="cred-item">
		<span class="cred-number">200+</span>
		<span class="cred-label">Engineering Teams Enabled</span>
	</div>
	<div class="cred-item">
		<span class="cred-number">40+</span>
		<span class="cred-label">Accounts Audited (TDT)</span>
	</div>
</div>
```

CSS for credibility bar (add to `<style>` block):

```css
.credibility-bar {
	display: flex;
	flex-wrap: wrap;
	gap: 1.5rem;
	padding: 1.5rem 2rem;
	background: radial-gradient(var(--gray-900), var(--gray-800) 150%);
	border-radius: 1rem;
	box-shadow: var(--shadow-md);
	position: relative;
}

.credibility-bar::before {
	position: absolute;
	inset: -1px;
	content: "";
	background: var(--gradient-stroke);
	border-radius: 1rem;
	z-index: -1;
}

.cred-item {
	display: flex;
	flex-direction: column;
	align-items: center;
	flex: 1;
	min-width: 8rem;
	text-align: center;
}

.cred-number {
	font-size: var(--text-3xl);
	font-weight: 700;
	color: var(--accent-regular);
	line-height: 1;
}

.cred-label {
	font-size: var(--text-sm);
	color: var(--gray-400);
	margin-top: 0.25rem;
}
```

---

### Section 2: Flagship Project Block (NEW — insert after Skills/TechStack, before the "Infrastructure Projects" section)

Replace the current section header "Infrastructure Projects" and its generic description with a two-part section: flagship (TDT) followed by supporting projects.

```astro
<!-- Flagship Project -->
<section class="section with-background">
	<header class="section-header stack gap-2 lg:gap-4">
		<h3>Flagship Project</h3>
		<p>
			The work that best represents what I do and why it matters.
		</p>
	</header>
	<div class="flagship-card">
		<div class="flagship-content">
			<div class="flagship-label">Enterprise AWS — Technical Debt Tool</div>
			<h4 class="flagship-title">Programmatic Account Analysis at Scale</h4>
			<p class="flagship-body">
				In a Fortune 23 healthcare company with 800+ AWS accounts and 200+ engineering teams,
				most teams lacked the expertise to evaluate whether their infrastructure was cost-efficient,
				secure, or compliant. No centralized visibility existed. I designed and built a
				Python/PostgreSQL platform that programmatically analyzes AWS account configurations —
				identifying phantom resources, orphaned infrastructure, security misconfigurations,
				IAM overprovisioning, and cost optimization opportunities. Deployed across 40+ accounts.
			</p>
			<p class="flagship-body">
				Currently rebuilding with architectural improvements informed by v1 lessons.
			</p>
			<a href="/work/tdt-technical-debt-tool/" class="flagship-link">
				Read the full case study →
			</a>
		</div>
	</div>
</section>
```

CSS for flagship card (add to `<style>` block):

```css
.flagship-card {
	border: 1px solid var(--gray-800);
	border-radius: 1.5rem;
	padding: 2rem;
	background: var(--gradient-subtle);
	box-shadow: var(--shadow-sm);
}

.flagship-label {
	font-size: var(--text-sm);
	color: var(--accent-regular);
	text-transform: uppercase;
	letter-spacing: 0.08em;
	margin-bottom: 0.5rem;
}

.flagship-title {
	font-size: var(--text-2xl);
	color: var(--gray-0);
	margin-bottom: 1rem;
}

.flagship-body {
	color: var(--gray-300);
	line-height: 1.6;
	margin-bottom: 0.75rem;
	max-width: 65ch;
}

.flagship-link {
	display: inline-block;
	margin-top: 0.5rem;
	color: var(--accent-regular);
	font-weight: 500;
	text-decoration: none;
}

.flagship-link:hover {
	text-decoration: underline;
}

@media (min-width: 50em) {
	.flagship-card {
		padding: 3rem;
	}
	.flagship-title {
		font-size: var(--text-3xl);
	}
}
```

---

### Section 3: Blog Showcase (NEW — insert after the projects section, before ContactCTA)

```astro
<!-- Blog Showcase -->
<section class="section with-background bg-variant">
	<header class="section-header stack gap-2 lg:gap-4">
		<h3>Recent Thinking</h3>
		<p>
			Observations from working inside 800+ account enterprise infrastructure.
			Not repackaged documentation — direct experience.
		</p>
	</header>
	<div class="blog-showcase">
		<a href="/blog/got-drift-infrastructure-reality-check/" class="blog-card">
			<div class="blog-card-quote">
				"IaC deployment is just the beginning. The real challenge is maintaining
				that single source of truth when reality inevitably drifts."
			</div>
			<div class="blog-card-title">Got Drift? The Infrastructure Reality Check Nobody Talks About</div>
		</a>
		<a href="/blog/beyond-dashboard-metrics-systems-thinking/" class="blog-card">
			<div class="blog-card-quote">
				"Metrics are invaluable, but they're not the system itself. Optimizing
				for the metric is not the same as improving the system."
			</div>
			<div class="blog-card-title">Beyond the Dashboard: Why Metrics Aren't the Whole Story</div>
		</a>
		<a href="/blog/show-dont-tell/" class="blog-card">
			<div class="blog-card-quote">
				"In a field full of unverifiable claims, deployed code is the only
				honest credential."
			</div>
			<div class="blog-card-title">Deployed Code Trumps Claims</div>
		</a>
	</div>
	<div class="cta" style="justify-self: center; margin-top: 1rem;">
		<CallToAction href="/blog/">
			View All Articles
			<Icon icon="arrow-right" size="1.2em" />
		</CallToAction>
	</div>
</section>
```

CSS for blog showcase (add to `<style>` block):

```css
.blog-showcase {
	display: grid;
	gap: 1.5rem;
	grid-template-columns: 1fr;
}

.blog-card {
	display: flex;
	flex-direction: column;
	gap: 0.75rem;
	padding: 1.5rem;
	border: 1px solid var(--gray-800);
	border-radius: 1rem;
	text-decoration: none;
	background: var(--gradient-subtle);
	transition: border-color var(--theme-transition), box-shadow var(--theme-transition);
}

.blog-card:hover {
	border-color: var(--accent-dark);
	box-shadow: var(--shadow-md);
}

.blog-card-quote {
	font-size: var(--text-md);
	color: var(--gray-200);
	font-style: italic;
	line-height: 1.5;
}

.blog-card-title {
	font-size: var(--text-sm);
	color: var(--accent-regular);
	font-weight: 500;
}

@media (min-width: 50em) {
	.blog-showcase {
		grid-template-columns: repeat(3, 1fr);
	}
}
```

---

### Section 4: Update existing "Infrastructure Projects" section

Change the section header to be less generic and point clearly to the work page:

```astro
<header class="section-header stack gap-2 lg:gap-4">
	<h3>Supporting Projects</h3>
	<p>
		Foundation infrastructure, observability services, and tools that demonstrate
		the same patterns used at enterprise scale — built with code you can inspect.
	</p>
</header>
```

Change the CTA button to point to `/work/` instead of `/architecture/`:

```astro
<div class="cta">
	<CallToAction href="/work/">
		View All Projects
		<Icon icon="arrow-right" size="1.2em" />
	</CallToAction>
</div>
```

---

## Acceptance Criteria
- [ ] Page title reflects "Infrastructure Platform Engineer" and scale language
- [ ] Hero tagline leads with outcome, not job title
- [ ] Credibility bar shows 4 confirmed metrics
- [ ] Flagship TDT block appears before the project grid with link to `/work/tdt-technical-debt-tool/`
- [ ] Blog showcase shows 3 posts with pull quotes
- [ ] Role pills visible on mobile (from impl-01)
- [ ] "View All Projects" CTA links to `/work/`
- [ ] No fabricated dollar figures anywhere

---

## Notes
- The `<Skills />` and `<TechStack />` components are unchanged — keep them between the hero and the new sections
- Verify blog post slugs match what's in `src/content/blog/` before hardcoding them
- The TDT project page (`/work/tdt-technical-debt-tool/`) must exist before this links correctly — it's created in impl-06, but the link can exist as a forward reference; it will 404 until impl-06 is done

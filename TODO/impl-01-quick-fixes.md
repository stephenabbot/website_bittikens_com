# Implementation 01: Quick Fixes
**Depends on:** Nothing — do this first
**Estimated session:** Short (< 1 hour)
**Goal:** Fix the five highest-visibility, lowest-effort issues that currently undermine credibility.

---

## Changes

### 1. ContactCTA.astro — Replace text and email
**File:** `src/components/ContactCTA.astro`

Replace the `<h2>` text and `href` email. This component appears on every page.

**Current:**
```
<h2>Interested in mentorship or community technology support?</h2>
<CallToAction href="mailto:stabbot@hotmail.com">
```

**New:**
```
<h2>Let's discuss your infrastructure challenges.</h2>
<CallToAction href="mailto:stephen.abbot@denverbytes.com">
```

No other changes to this file.

---

### 2. MainHead.astro — Fix Schema.org email
**File:** `src/components/MainHead.astro`

The Schema.org JSON-LD at line 31 has a personal yahoo address. Replace with professional email.

**Current:**
```
"email": "abbotnh@yahoo.com",
```

**New:**
```
"email": "stephen.abbot@denverbytes.com",
```

---

### 3. index.astro — Fix mobile role pills visibility
**File:** `src/pages/index.astro`

The `.roles` CSS class at line 112–113 hides the role pills on mobile. Remove the `display: none` rule. The pills should be visible at all screen sizes.

**Current (lines 111–113):**
```css
.roles {
    display: none;
}
```

**New:**
```css
.roles {
    display: flex;
    flex-wrap: wrap;
    gap: 0.5rem;
    margin-top: 0.5rem;
}
```

The `@media (min-width: 50em)` block at line 131–134 already sets `display: flex` and `gap`. That block can remain as-is since the above makes mobile consistent.

---

### 4. 404.astro — Add navigation links
**File:** `src/pages/404.astro`

The current page is empty except for a Hero component. Add helpful navigation links.

**Replace entire file with:**
```astro
---
import BaseLayout from '../layouts/BaseLayout.astro';
---

<BaseLayout title="Not Found" description="404 Error — this page was not found">
	<div class="wrapper stack gap-20">
		<main class="stack gap-8" style="padding: 4rem 1.5rem; max-width: 50ch; margin: 0 auto; text-align: center;">
			<h1 style="font-size: var(--text-4xl); color: var(--gray-0);">Page Not Found</h1>
			<p style="font-size: var(--text-lg); color: var(--gray-300);">
				This page doesn't exist or may have moved.
			</p>
			<nav style="display: flex; flex-wrap: wrap; gap: 1rem; justify-content: center; margin-top: 2rem;">
				<a href="/" style="padding: 0.5rem 1.25rem; background: var(--accent-regular); color: var(--accent-text-over); border-radius: 999rem; text-decoration: none; font-weight: 500;">Home</a>
				<a href="/architecture/" style="padding: 0.5rem 1.25rem; border: 1px solid var(--gray-700); color: var(--gray-300); border-radius: 999rem; text-decoration: none;">Architecture</a>
				<a href="/experience/" style="padding: 0.5rem 1.25rem; border: 1px solid var(--gray-700); color: var(--gray-300); border-radius: 999rem; text-decoration: none;">Experience</a>
				<a href="/work/" style="padding: 0.5rem 1.25rem; border: 1px solid var(--gray-700); color: var(--gray-300); border-radius: 999rem; text-decoration: none;">Projects</a>
				<a href="/resume/" style="padding: 0.5rem 1.25rem; border: 1px solid var(--gray-700); color: var(--gray-300); border-radius: 999rem; text-decoration: none;">Resume</a>
				<a href="/blog/" style="padding: 0.5rem 1.25rem; border: 1px solid var(--gray-700); color: var(--gray-300); border-radius: 999rem; text-decoration: none;">Blog</a>
			</nav>
		</main>
	</div>
</BaseLayout>
```

---

### 5. website-infrastructure.md — Fix typo
**File:** `src/content/work/website-infrastructure.md`

Line 45 has `denverbites.com` (typo). It should be `denverbytes.com`.

**Find:**
```
- **denverbites.com** - redirect to denverbytes.com
```

**Replace with:**
```
- **denverbytes.com** - Production website
- **denverbites.com** - Redirect alias to denverbytes.com
```

---

## Acceptance Criteria
- [ ] Every page footer/CTA shows "Let's discuss your infrastructure challenges" and links to `stephen.abbot@denverbytes.com`
- [ ] Schema.org JSON-LD in page source shows `stephen.abbot@denverbytes.com`
- [ ] Role pills (SRE / Cloud Architect / Mentor) are visible on mobile
- [ ] 404 page has working links to Home, Architecture, Experience, Projects, Resume, Blog
- [ ] `website-infrastructure.md` has correct spelling of denverbytes.com

---

## Notes
- Do NOT change the CTA button label "Send Me a Message" — only the heading and email href
- Do NOT touch any other email-related content (TODO files, scripts) — those are not deployed
- The `dist/` directory will be regenerated on next build; no need to touch it

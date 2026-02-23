# Implementation 07: Final Testing on bittikens.com
**Depends on:** impl-01 through impl-06 all complete
**Estimated session:** Short–Medium (1 hour)
**Goal:** Deploy to bittikens.com staging and verify all changes work correctly before migration to production.

---

## Step 1: Set GitHub Variable (one-time prerequisite)

The bittikens.com repo has never been successfully deployed. Before running the deploy script, the `AWS_ACCOUNT_ID` GitHub variable must be set:

```bash
gh variable set AWS_ACCOUNT_ID --body "694394480102" --repo stephenabbot/website_bittikens_com
```

Verify it was set:

```bash
gh variable list --repo stephenabbot/website_bittikens_com
```

---

## Step 2: Local Build Verification

Before deploying, build locally to catch any errors:

Write to `z_runcommands.sh` and run:

```bash
cd /Users/stephenabbot/projects/website_bittikens_com
npm run build 2>&1
```

**Expected:** Build completes with no errors. Warnings about unused CSS or missing alt text are acceptable. Any TypeScript errors or missing component imports must be fixed before proceeding.

Common issues to watch for:
- `astro-navbar` import errors (if impl-02 is done — verify the package is installed and import paths are correct)
- Missing content file references (if TDT or email-handler pages are linked but the `.md` files don't exist yet)
- Broken image references in frontmatter (verify `stock-3.jpg` and `stock-2.jpg` exist in `public/assets/`)

---

## Step 3: Deploy to bittikens.com

```bash
./scripts/deploy.sh
```

The deploy script handles `npm install`, build, S3 upload, CloudFront invalidation, and basic verification. Watch for:
- DNS verification warning for `GOOGLE_SEARCH_CONSOLE_TXT` — expected, not a failure
- S3 upload success confirmation
- CloudFront invalidation ID returned

---

## Step 4: Enable Basic Auth

```bash
./scripts/manage-cloudfront-auth.sh enable
```

Wait approximately 3 minutes for CloudFront propagation before testing.

Verify auth is working:

```bash
# Should return 401
curl -I https://bittikens.com

# Should return 200
curl -I -u stabbot:changeme https://bittikens.com
```

---

## Step 5: Full Test Checklist

Test all items below. Use a browser with DevTools open (Console tab) to catch JS errors.

### Navigation
- [ ] Nav shows exactly 6 items: Home | Projects ▾ | Architecture | Experience | Blog | Resume
- [ ] "Technologies" and "About" are NOT in the main nav
- [ ] Projects dropdown opens on click/hover (desktop)
- [ ] Dropdown shows 4 groups: Enterprise Tools / Foundation / Services & Tools / Website
- [ ] All 9 project links in the dropdown resolve without 404
- [ ] "View All Projects →" in dropdown links to `/work/`
- [ ] Mobile: hamburger menu opens and shows all nav items including Projects
- [ ] Active page highlight works (current page link highlighted)
- [ ] Social icons (GitHub, LinkedIn) and theme toggle present in nav footer
- [ ] Theme toggle works (light/dark)

### Homepage
- [ ] Hero tagline leads with outcome language (not "Site Reliability Engineer and Cloud Architect specializing in...")
- [ ] Role pills (SRE / Cloud Architect / Mentor) visible on mobile
- [ ] Credibility bar shows 4 metrics: 20+ years, 800+ accounts, 200+ teams, 40+ audited
- [ ] TDT flagship block appears with link to `/work/tdt-technical-debt-tool/`
- [ ] Blog showcase shows 3 posts with pull quotes and correct links
- [ ] Blog post links resolve without 404
- [ ] "View All Projects" CTA links to `/work/` (not `/architecture/`)
- [ ] No dollar figures for TDT cost savings anywhere

### Projects Page (`/work/`)
- [ ] Page shows 4 grouped tables (no card grid)
- [ ] TDT row has "Flagship" badge and links to case study
- [ ] Email Handler row present
- [ ] All 9 projects listed with one-line descriptions
- [ ] GitHub links open in new tab
- [ ] Mobile: table is still scannable (description column may hide, name + links remain)

### Individual Project Pages
- [ ] `/work/tdt-technical-debt-tool/` loads — no code, no repo link, has V2 section
- [ ] `/work/service-email-handler/` loads with correct content
- [ ] All 7 existing project pages load with Problem → Approach → Outcome → Stack format
- [ ] AWS pillars `<details>` section is collapsed by default on all project pages
- [ ] `<details>` expands and collapses when clicked
- [ ] No fabricated metrics on any project page

### Email and Contact
- [ ] Every page CTA shows "Let's discuss your infrastructure challenges."
- [ ] CTA button links to `mailto:stephen.abbot@denverbytes.com`
- [ ] View page source on any page — Schema.org JSON-LD shows `"email": "stephen.abbot@denverbytes.com"`
- [ ] No `stabbot@hotmail.com` or `abbotnh@yahoo.com` visible anywhere on the rendered site

### 404 Page
- [ ] Navigate to `https://bittikens.com/this-does-not-exist/` — renders the custom 404 page
- [ ] 404 page has working nav links: Home, Architecture, Experience, Projects, Resume, Blog

### Technical
- [ ] Browser console shows no JavaScript errors on any page
- [ ] `https://bittikens.com/robots.txt` shows `bittikens.com` in the Sitemap URL
- [ ] `https://bittikens.com/sitemap-0.xml` accessible and contains correct URLs
- [ ] All pages load over HTTPS with valid certificate

---

## Step 6: Fix Any Failures

For each failed checklist item:
1. Identify the source file causing the issue
2. Make the fix
3. Rebuild locally (`npm run build`) to verify the fix
4. Redeploy (`./scripts/deploy.sh`)
5. Re-check the failed item

Do not proceed to impl-08 until all checklist items pass.

---

## Acceptance Criteria
- [ ] All checklist items above pass
- [ ] No console errors on any page
- [ ] Deploy script completed without errors
- [ ] Basic auth functioning on bittikens.com

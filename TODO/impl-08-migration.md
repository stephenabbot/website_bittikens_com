# Implementation 08: Migrate Changes to denverbytes.com (Production)
**Depends on:** impl-07 complete — all tests passing on bittikens.com
**Estimated session:** Short (30–45 minutes)
**Goal:** Promote all validated changes from bittikens.com (staging) to denverbytes.com (production).

---

## Overview

The two repos share the same codebase structure. The migration copies changed `src/` files from `website_bittikens_com` into `website_denverbytes_com`, then adjusts the small number of domain-specific values. Infrastructure config files (`config.env`, `astro.config.mjs`, etc.) are NOT copied — they are already correct in the denverbytes repo.

---

## Step 1: Identify All Changed Source Files

From the `website_bittikens_com` repo root, get the full list of changed files relative to the initial commit:

Write to `z_runcommands.sh` and run:

```bash
cd /Users/stephenabbot/projects/website_bittikens_com
git diff 63f6622 HEAD -- src/ --name-only 2>&1
git diff 63f6622 HEAD -- public/ --name-only 2>&1
```

(The initial commit hash is `63f6622` per git log.)

Save the output — this is the definitive list of files to copy.

---

## Step 2: Verify the denverbytes Repo Location

Confirm the production repo path:

```bash
ls /Users/stephenabbot/projects/website_denverbytes_com/src/ 2>/dev/null || echo "Check path"
```

Adjust the path below if different.

---

## Step 3: Copy Changed Files

For each file in the list from Step 1, copy from bittikens to denverbytes. A script approach:

Write to `z_runcommands.sh` and run:

```bash
BITTI=/Users/stephenabbot/projects/website_bittikens_com
DENVER=/Users/stephenabbot/projects/website_denverbytes_com
OUT="$BITTI/z_results.txt"

echo "=== Migration: files copied ===" > "$OUT"
echo "Run date: $(date)" >> "$OUT"
echo "" >> "$OUT"

# Get list of changed src/ files
CHANGED=$(git -C "$BITTI" diff 63f6622 HEAD -- src/ public/ --name-only 2>/dev/null)

for f in $CHANGED; do
  src_file="$BITTI/$f"
  dst_file="$DENVER/$f"
  dst_dir=$(dirname "$dst_file")

  if [ -f "$src_file" ]; then
    mkdir -p "$dst_dir"
    cp "$src_file" "$dst_file"
    echo "COPIED: $f" >> "$OUT"
  else
    echo "SKIPPED (not found): $f" >> "$OUT"
  fi
done

echo "" >> "$OUT"
echo "=== DONE ===" >> "$OUT"
```

Review `z_results.txt` to confirm all expected files were copied and none were unexpectedly skipped.

---

## Step 4: Apply Domain-Specific Adjustments

These 5 files were copied from bittikens but contain bittikens-specific values. Edit each in the denverbytes repo:

### 4a. `src/config.ts`
```ts
// Change:
domain: 'bittikens.com',
siteUrl: 'https://bittikens.com',
repoName: 'website_bittikens_com',
repoUrl: 'https://github.com/stephenabbot/website_bittikens_com',

// To:
domain: 'denverbytes.com',
siteUrl: 'https://denverbytes.com',
repoName: 'website_denverbytes_com',
repoUrl: 'https://github.com/stephenabbot/website_denverbytes_com',
```

### 4b. `src/content/resume/resume.md`
```yaml
# Change:
website: "https://bittikens.com"

# To:
website: "https://denverbytes.com"
```

### 4c. `src/content/work/website-infrastructure.md`
The domain listing should reflect that denverbytes.com is the primary production site:
```markdown
# Change order — denverbytes is primary here:
- **denverbytes.com** — Production website (primary)
- **bittikens.com** — Staging/development site
- **denverbites.com** — Redirect alias to denverbytes.com
```

### 4d. `src/content/work/professional-website-platform.md`
```markdown
# Change:
**Repository**: [website_bittikens_com](https://github.com/stephenabbot/website_bittikens_com)
**Live Site**: [bittikens.com](https://bittikens.com)

# To:
**Repository**: [website_denverbytes_com](https://github.com/stephenabbot/website_denverbytes_com)
**Live Site**: [denverbytes.com](https://denverbytes.com)
```

### 4e. `src/pages/architecture.astro`
Find the GitHub link to `website_bittikens_com` and change to `website_denverbytes_com`. Based on the source file, this is around line 201:
```
# Change:
href="https://github.com/stephenabbot/website_bittikens_com"

# To:
href="https://github.com/stephenabbot/website_denverbytes_com"
```

---

## Step 5: Verify No Stray bittikens References

Write to `z_runcommands.sh` and run against the **denverbytes** repo:

```bash
DENVER=/Users/stephenabbot/projects/website_denverbytes_com
OUT=/Users/stephenabbot/projects/website_bittikens_com/z_results.txt

echo "=== Verify: bittikens refs in denverbytes src/ ===" > "$OUT"
echo "Run date: $(date)" >> "$OUT"
echo "" >> "$OUT"

grep -rn "bittikens" "$DENVER/src/" \
  --exclude-dir=".git" \
  --exclude-dir="node_modules" 2>/dev/null >> "$OUT"

echo "" >> "$OUT"
echo "--- stabbot@hotmail or yahoo email refs ---" >> "$OUT"
grep -rn "stabbot@hotmail\|abbotnh@yahoo" "$DENVER/src/" 2>/dev/null >> "$OUT"

echo "" >> "$OUT"
echo "=== DONE ===" >> "$OUT"
```

**Expected result:** Zero matches. Any match that appears is either:
- A remaining domain-specific reference that needs the Step 4 fix applied, or
- An intentional reference (e.g., `website-infrastructure.md` listing bittikens.com as the staging site — that one is correct)

Review and resolve all unexpected matches before deploying.

---

## Step 6: Build and Deploy to denverbytes.com

From the denverbytes repo:

```bash
cd /Users/stephenabbot/projects/website_denverbytes_com
npm run build
./scripts/deploy.sh
```

---

## Step 7: Post-Migration Smoke Test

Verify the production site. No basic auth on denverbytes.com:

```bash
# Should return 200 directly
curl -I https://denverbytes.com

# Spot-check key pages
curl -I https://denverbytes.com/work/tdt-technical-debt-tool/
curl -I https://denverbytes.com/work/service-email-handler/
curl -I https://denverbytes.com/work/
```

Then manually verify in a browser:
- [ ] Homepage hero shows updated tagline
- [ ] Projects dropdown works
- [ ] TDT page loads at `denverbytes.com/work/tdt-technical-debt-tool/`
- [ ] CTA email shows `stephen.abbot@denverbytes.com`
- [ ] Page source Schema.org email shows `stephen.abbot@denverbytes.com`
- [ ] No visible references to bittikens.com anywhere on the rendered site (except website-infrastructure.md listing it as staging)
- [ ] robots.txt shows `denverbytes.com`

---

## Step 8: Commit in Both Repos

Once both sites are verified, commit the changes in both repos:

**bittikens repo:**
```bash
cd /Users/stephenabbot/projects/website_bittikens_com
git add src/ public/
git status  # review before committing
git commit -m "Refactor: hero, nav dropdown, projects page, TDT page, project page rewrites"
```

**denverbytes repo:**
```bash
cd /Users/stephenabbot/projects/website_denverbytes_com
git add src/ public/
git status  # review before committing
git commit -m "Refactor: hero, nav dropdown, projects page, TDT page, project page rewrites"
```

---

## Files NOT Copied (already correct in each repo)

For reference — these files are intentionally different between the two repos and should never be overwritten from bittikens:

| File | Why it stays |
|------|-------------|
| `config.env` | `DOMAIN_NAME=denverbytes.com` |
| `astro.config.mjs` | `site: 'https://denverbytes.com'` |
| `package.json` | `"name": "website_denverbytes_com"` |
| `.github/workflows/deploy.yml` | Different OIDC role ARN |
| `.github/workflows/destroy.yml` | Different OIDC role ARN |
| `scripts/cloudfront-basic-auth.js` | No basic auth on production |
| `scripts/manage-cloudfront-auth.sh` | No basic auth on production |
| `README.md` | Repo-specific content |
| `docs/` | Repo-specific operational docs |
| `TODO/` | Planning docs, not deployed |

---

## Acceptance Criteria
- [ ] All Step 4 domain-specific adjustments applied in denverbytes repo
- [ ] Step 5 grep returns zero unexpected bittikens references
- [ ] `./scripts/deploy.sh` completes without errors in denverbytes repo
- [ ] Step 7 smoke test passes
- [ ] Both repos committed

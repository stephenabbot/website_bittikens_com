#!/usr/bin/env bash
set -euo pipefail
REPO="/Users/stephenabbot/projects/website_bittikens_com"
cd "$REPO"

echo "=== Remove stock image from project detail pages ==="

python3 << 'PYEOF'
import pathlib
p = pathlib.Path('src/pages/work/[...slug].astro')
lines = p.read_text().splitlines(keepends=True)
out = []
i = 0
while i < len(lines):
    if ('entry.data.img &&' in lines[i] and
        i+2 < len(lines) and
        '<img src={entry.data.img}' in lines[i+1] and
        lines[i+2].strip() == ')}'):
        i += 3
    else:
        out.append(lines[i])
        i += 1
p.write_text(''.join(out))
print(f"Done. File now has {len(out)} lines.")
PYEOF

echo "--- Verify ---"
python3 -c "
import pathlib
t = pathlib.Path('src/pages/work/[...slug].astro').read_text()
if 'entry.data.img &&' in t:
    print('FAIL: img block still present')
else:
    print('clean — img render removed')
"

echo "--- Build ---"
npm run build 2>&1 | grep -E "error|Error|Complete|✓" | tail -5

echo ""
echo "=== Git ==="
git add "src/pages/work/[...slug].astro"
git commit -m "$(cat <<'EOF'
Remove stock images from project detail pages

Generic abstract stock photos add no informational value and push
content below the fold. The theme background provides ambient visual
interest without competing with the technical content.

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
EOF
)"
git push

echo ""
echo "=== Deploy ==="
./scripts/deploy.sh 2>&1 | grep -E "✓|✗|ERROR|invalidat|DEPLOY" | tail -10

echo "=== Done ==="

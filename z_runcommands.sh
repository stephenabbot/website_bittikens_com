#!/usr/bin/env bash
set -euo pipefail
REPO="/Users/stephenabbot/projects/website_bittikens_com"
cd "$REPO"

echo "=== Nav.astro: Fix dropdown bugs ==="

python3 - << 'PYEOF'
import pathlib
f = pathlib.Path('src/components/Nav.astro')
t = f.read_text()

# Bug 1 fix: add display:none as default mobile state for .menu-content
# The @media (min-width: 50em) block already sets display:contents — this just
# makes mobile start hidden so the library's hidden-class toggle works correctly.
old = """\t.menu-content {
		position: absolute;
		left: 0;
		right: 0;
		background-color: var(--gray-999);
		border-bottom: 1px solid var(--gray-800);
		border-radius: 0 0 0.75rem 0.75rem;
		box-shadow: var(--shadow-lg);
	}"""
new = """\t.menu-content {
		display: none;
		position: absolute;
		left: 0;
		right: 0;
		background-color: var(--gray-999);
		border-bottom: 1px solid var(--gray-800);
		border-radius: 0 0 0.75rem 0.75rem;
		box-shadow: var(--shadow-lg);
	}"""
assert old in t, "Bug1 target not found"
t = t.replace(old, new)

# Bug 2 fix: replace plain <div class="dropdown-menu"> with <DropdownItems class="dropdown-menu">
# so the library applies astronav-dropdown dropdown-toggle hidden classes it needs
old2 = """\t\t\t\t\t<DropdownItems>
							<div class="dropdown-menu">"""
new2 = """\t\t\t\t\t<DropdownItems class="dropdown-menu">
							<div class="dropdown-inner">"""
assert old2 in t, "Bug2 open tag not found"
t = t.replace(old2, new2)

old3 = """\t\t\t\t\t\t</div>
						</DropdownItems>"""
new3 = """\t\t\t\t\t\t</div>
						</DropdownItems>"""
# closing tags are the same — no change needed there

# Also update the CSS: .dropdown-menu selector now targets the DropdownItems wrapper,
# .dropdown-inner handles the inner panel styling
old4 = """\t.dropdown-menu {
		background-color: var(--gray-999);
		border: 1px solid var(--gray-800);
		border-radius: 0.75rem;
		padding: 0.75rem;
		margin-top: 0.25rem;
		min-width: 14rem;
		box-shadow: var(--shadow-lg);
		display: flex;
		flex-direction: column;
		gap: 0.5rem;
	}"""
new4 = """\t.dropdown-menu {
		margin-top: 0.25rem;
	}

	.dropdown-inner {
		background-color: var(--gray-999);
		border: 1px solid var(--gray-800);
		border-radius: 0.75rem;
		padding: 0.75rem;
		min-width: 14rem;
		box-shadow: var(--shadow-lg);
		display: flex;
		flex-direction: column;
		gap: 0.5rem;
	}"""
assert old4 in t, "Bug2 CSS target not found"
t = t.replace(old4, new4)

# Desktop: update .dropdown-menu positioning (the DropdownItems wrapper, not the inner panel)
old5 = """\t\t.dropdown-menu {
			position: absolute;
			top: calc(100% + 0.5rem);
			left: 50%;
			transform: translateX(-50%);
			z-index: 100;
			width: 16rem;
		}"""
new5 = """\t\t.dropdown-menu {
			position: absolute;
			top: calc(100% + 0.5rem);
			left: 50%;
			transform: translateX(-50%);
			z-index: 100;
			width: 16rem;
		}

		.dropdown-inner {
			width: 100%;
		}"""
assert old5 in t, "Bug2 desktop CSS target not found"
t = t.replace(old5, new5)

f.write_text(t)
print("Nav.astro patched successfully")
PYEOF

echo ""
echo "=== Verification ==="
echo "--- Bug 1: menu-content has display:none ---"
grep -A8 '\.menu-content {' src/components/Nav.astro | head -10

echo "--- Bug 2: DropdownItems has class prop ---"
grep "DropdownItems" src/components/Nav.astro

echo "--- Bug 2: no bare <div class=\"dropdown-menu\"> ---"
grep '<div class="dropdown-menu">' src/components/Nav.astro || echo "clean — no bare dropdown-menu div"

echo ""
echo "=== Test build ==="
npm run build 2>&1 | grep -E "error|Error|warn|built|Complete|✓" | tail -10

echo ""
echo "=== All done ==="

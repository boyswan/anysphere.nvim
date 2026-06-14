#!/usr/bin/env sh
set -eu

theme="${1:-cursor-anysphere-theme/themes/anysphere-theme.json}"

if [ ! -f "$theme" ]; then
  echo "missing theme file: $theme" >&2
  exit 1
fi

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

jq -r '[.. | strings | ascii_downcase | select(test("^#[0-9a-f]{6}$"))] | unique | .[]' "$theme" > "$tmpdir/vscode-rgb"
jq -r '[.. | strings | ascii_downcase | select(test("^#[0-9a-f]{8}$"))] | unique | .[]' "$theme" > "$tmpdir/vscode-rgba"
rg -o '#[0-9A-Fa-f]{6}' lua colors README.md scripts \
  | sed 's/^.*:#/#/' \
  | tr '[:upper:]' '[:lower:]' \
  | sort -u > "$tmpdir/nvim-rgb"

echo "Missing opaque VS Code colors in Neovim palette:"
if comm -23 "$tmpdir/vscode-rgb" "$tmpdir/nvim-rgb" | grep .; then
  exit 1
else
  echo "none"
fi

echo
echo "Extra Neovim colors:"
comm -13 "$tmpdir/vscode-rgb" "$tmpdir/nvim-rgb" || true

echo
echo "VS Code alpha colors, resolved manually where Neovim needs an RGB value:"
cat "$tmpdir/vscode-rgba"

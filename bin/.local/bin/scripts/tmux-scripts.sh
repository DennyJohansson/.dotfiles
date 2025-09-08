#!/usr/bin/env bash

set -euo pipefail

find_pkg_root() {
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    [[ -f "$dir/package.json" ]] && { printf '%s\n' "$dir"; return 0; }
    dir="$(dirname "$dir")"
  done
  return 1
}

proj="$(find_pkg_root)" || { echo "No package.json found"; exit 1; }
cd "$proj"

script="$(jq -r '.scripts | keys[]?' package.json |
  fzf --prompt='[N]pm run > ')"

[[ -n "${script:-}" ]] && npm run "$script"



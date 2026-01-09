#!/usr/bin/env bash
set -euo pipefail

printf "find scritp"
script="$(jq -r '.scripts | keys[]?' package.json |
  fzf --prompt='[N]pm run > ' --header='package.json scripts')"

printf "yes $script"


[[ -n "${script:-}" ]] && npm run "$script"


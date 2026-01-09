#!/usr/bin/env bash
set -euo pipefail

start_dir="${1:-$PWD}"

options=$(
cat <<'EOF'
mci		[M]aven [C]lean [I]nstall		mvn clean install
mcis		[M]aven [C]lean [I]nstall and [S]kip tests		mvn clean install -Dmaven.test.skip=true
mcg		[M]aven [C]lean [G]enerate		mvn clean generate-sources
mgs		[M]aven [G]enerate [S]ources		mvn generate-sources -DskipCheckstyle -DskipSpotbugs -Dmaven.test.skip=true
mgts		[M]aven [G]enerate [T]est [S]ources	mvn generate-test-sources -DskipCheckstyle -DskipSpotbugs -Dmaven.test.skip=true
EOF
)

selected="$(printf "%s\n" "$options" | fzf --delimiter='\t+' --with-nth=2 --prompt='[m]aven > ')"
[[ -z "${selected:-}" ]] && exit 0

cmd="$(awk -F'\t+' '{print $3}' <<<"$selected" | xargs)"

tmux neww -c "$start_dir" "zsh -lc '$cmd; echo; echo \"[Press Enter to quit]\"; read'"


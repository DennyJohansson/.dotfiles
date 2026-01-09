function set-title-precmd() {
  printf "\e]2;%s\a" "${PWD/#$HOME/~}"
}

function set-title-preexec() {
  printf "\e]2;%s\a" "$1"
}

setopt AUTO_CD # Go to folder path without using cd.
setopt inc_append_history
setopt EXTENDED_HISTORY

autoload -Uz add-zsh-hook

fpath=($HOME/zsh-completions/src $fpath)
autoload -Uz compinit
compinit -C

add-zsh-hook precmd set-title-precmd
add-zsh-hook preexec set-title-preexec

source $HOME/.zsh-git
source $HOME/.zsh-prompt

alias rm-parent-dir="cd -P . &&
  mv -- *(D) .. &&
  cd -P .. &&
  rmdir ~-"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias ll='ls -lah'
alias cl="clear"
alias ls='ls --color=auto -hv'

# [M]aven [C]lean [I]nstall
alias mci='mvn clean install'
# [M]aven [C]lean [I]nstall and [S]kip tests
alias mcis='mvn clean install -Dmaven.test.skip=true'
# [M]aven [C]lean [G]enerate
alias mcg='mvn clean generate-sources'
# [M]aven [G]enerate [S]ources
alias mgs='mvn generate-sources -DskipCheckstyle -DskipSpotbugs -Dmaven.test.skip=true'
# [M]aven [G]enerate [T]est [S]ources
alias mgts='mvn generate-test-sources -DskipCheckstyle -DskipSpotbugs -Dmaven.test.skip=true'

# Kubernetes
alias kdev='kubectx gke_dev-envc52ce870_europe-west1_dev-env-gke'
alias kprod='kubectx gke_production-env66d705bb_europe-west1_production-env-gke'

alias gauth='gcloud auth login && gcloud auth application-default login'

# fzf pid's to kill
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

# fuzzy-search scripts from package.json and run them
fscript() {
  local script
  script=$(jq -r '.scripts | keys[]' package.json | fzf) || return
  [[ -n $script ]] && npm run "$script"
}

# search history, and run
fhistory() {
  local cmd
  cmd=$(fc -ln -m "*$* *" 1 | fzf) || return
  [[ -z $cmd ]] && return
  print -s -- "$cmd"
  eval "$cmd"
}

alias fh='fc -ln -m "*$* *" 1 | fzf'

# record time to startup azsh
alias zsh_zprof=time ZSH_DEBUGRC=1 zsh -i -c exit

# The next line enables shell command completion for gcloud.
__load_gcloud() {
  unset -f gcloud gsutil bq
  [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ] && . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'
  [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ] && . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'
}

gcloud(){ __load_gcloud; gcloud "$@"; }
gsutil(){ __load_gcloud; gsutil "$@"; }
bq()    { __load_gcloud; bq "$@"; }

# fnm (lazy)
export FNM_PATH="/opt/homebrew/opt/fnm/bin"
export PATH="$FNM_PATH:$PATH"

__load_fnm() {
  unset -f node npm npx pnpm corepack fnm
  eval "$(fnm env --shell zsh)"
}

node()    { __load_fnm; node "$@"; }
npm()     { __load_fnm; npm "$@"; }
npx()     { __load_fnm; npx "$@"; }
pnpm()    { __load_fnm; pnpm "$@"; }
corepack(){ __load_fnm; corepack "$@"; }
fnm()     { __load_fnm; fnm "$@"; }


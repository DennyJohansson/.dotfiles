function set-title-precmd() {
  printf "\e]2;%s\a" "${PWD/#$HOME/~}"
}

function set-title-preexec() {
  printf "\e]2;%s\a" "$1"
}

setopt AUTO_CD # Go to folder path without using cd.
setopt inc_append_history
autoload -Uz add-zsh-hook
autoload -U compinit && compinit

add-zsh-hook precmd set-title-precmd
add-zsh-hook preexec set-title-preexec
source $HOME/.zsh-git
source $HOME/.zsh-prompt

alias removeparentdir="cd -P . &&
  mv -- *(D) .. &&
  cd -P .. &&
  rmdir ~-"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# General
alias ll='ls -lah' #List files with more information
alias cl="clear"
alias pn="pnpm"
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

# zsh autocompletions
# git clone https://github.com/zsh-users/zsh-completions.git \
#  ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
fpath=($HOME/zsh-completions/src $fpath)

##THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

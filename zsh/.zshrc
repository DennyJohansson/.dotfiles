# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Q pre block. Keep at the top of this file.
alias cl="clear"
alias pn="pnpm"
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$HOME/Library/Python/2.7/bin:$HOME/.local/bin:$PATH
#
function set-title-precmd() {
  printf "\e]2;%s\a" "${PWD/#$HOME/~}"
}

function set-title-preexec() {
  printf "\e]2;%s\a" "$1"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd set-title-precmd
add-zsh-hook preexec set-title-preexec

export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME='cdimascio-lambda' #'powerlevel10k/powerlevel10k'
ZSH_THEME='refined'
plugins=(git yarn zsh-tmux-auto-title) 

source $ZSH/oh-my-zsh.sh

alias removeparentdir="cd -P . &&
  mv -- *(D) .. &&
  cd -P .. &&
  rmdir ~-"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source ~/Git/dotfiles/.aliases
# source ~/Git/dotfiles/.functions
# source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# export PATH="$HOME/tools/lua-language-server/bin/macOS:$PATH"
# export PATH="$HOME/.local/bin/scripts:$PATH"

# Set nvim as default editor for Git CLI
export EDITOR=nvim
# export TERM=xterm-256color
# export TERM=xterm-kitty-256color

# source ~/.ignore.sh
# bun completions
[ -s "/Users/dennyjohansson/.bun/_bun" ] && source "/Users/dennyjohansson/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"

# PATH
PATH="$PATH:/path/to/elixir/bin"
PATH="/usr/local/sbin:/usr/local/bin:$BUN_INSTALL/bin:$PATH"
PATH="$PATH:/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/gke-gcloud-auth-plugin"
PATH="$PATH:/Users/dennyjohansson/.local/share/nvim/mason/bin"
PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export PATH

export USE_GKE_GCLOUD_AUTH_PLUGIN=true # needed until kubectl 1.25
# General
alias ll='ls -lah' #List files with more information
alias mci='mvn clean install'
alias mcit='mvn clean install -Dmaven.test.skip=true'
# Maven
alias mcg='mvn clean generate-sources'
# Kubernetes
alias kdev='kubectx gke_dev-envc52ce870_europe-west1_dev-env-gke'
alias kprod='kubectx gke_production-env66d705bb_europe-west1_production-env-gke'

# Q post block. Keep at the bottom of this file.
## git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

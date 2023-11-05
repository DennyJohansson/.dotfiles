# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
alias cl="clear"
alias pn="pnpm"
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/Library/Python/2.7/bin:$HOME/.local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME='cdimascio-lambda' #'powerlevel10k/powerlevel10k'
ZSH_THEME='refined'
plugins=(git yarn) 

source $ZSH/oh-my-zsh.sh

alias removeparentdir="cd -P . &&
  mv -- *(D) .. &&
  cd -P .. &&
  rmdir ~-"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"

# source ~/Git/dotfiles/.aliases
# source ~/Git/dotfiles/.functions
# source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/tools/lua-language-server/bin/macOS:$PATH"
export PATH="$HOME/.local/bin/scripts:$PATH"

# Set nvim as default editor for Git CLI
export EDITOR=nvim
export TERM=xterm-256color

source ~/.ignore.sh

# pnpm
export PNPM_HOME="/Users/dennyjohansson/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

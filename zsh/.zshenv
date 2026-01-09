# PATH
PATH="$PATH:/path/to/elixir/bin"
PATH="/usr/local/sbin:/usr/local/bin:$BUN_INSTALL/bin:$PATH"
PATH="$PATH:/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/gke-gcloud-auth-plugin"
PATH="$PATH:/Users/dennyjohansson/.local/share/nvim/mason/bin"
PATH="/opt/homebrew/bin:$PATH"
export PATH

export BUN_INSTALL="$HOME/.bun"

export EDITOR="nvim"
export VISUAL="nvim"

# Java intellij dependencies
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export USE_GKE_GCLOUD_AUTH_PLUGIN=true # needed until kubectl 1.25

# Man pages
export MANPAGER='nvim +Man!'

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

export SDKMAN_DIR="$HOME/.sdkman"
sdk() {
  unset -f sdk
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
  sdk "$@"
}

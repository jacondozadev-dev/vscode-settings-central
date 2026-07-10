# -----------------------------------------------------------------------------
# Environment
# -----------------------------------------------------------------------------
export REQUESTS_CA_BUNDLE="$HOME/Documents/certificados/ROOTBANCOLOMBIACA.pem"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"

# -----------------------------------------------------------------------------
# History
# -----------------------------------------------------------------------------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.histfile"

# -----------------------------------------------------------------------------
# Completion
# -----------------------------------------------------------------------------
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Angular CLI completion
source <(ng completion script)

# -----------------------------------------------------------------------------
# Prompt
# -----------------------------------------------------------------------------
autoload -U colors && colors
eval "$(starship init zsh)"

# -----------------------------------------------------------------------------
# Node / fnm
# -----------------------------------------------------------------------------
eval "$(fnm env --use-on-cd)"

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------
alias setnode='node --version > .node-version'

# -----------------------------------------------------------------------------
# Zsh plugins
# -----------------------------------------------------------------------------
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Syntax highlighting should be loaded near the end.
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# -----------------------------------------------------------------------------
# SDKMAN
# -----------------------------------------------------------------------------
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

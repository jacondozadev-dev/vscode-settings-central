# Certs
export REQUESTS_CA_BUNDLE=~/Documents/certificados/ROOTBANCOLOMBIACA.pem

# starship
autoload -U colors && colors
# load Staship Prompt
eval "$(starship init zsh)"
# History :
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.histfile
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # Include hidden files.
# Load zsh-syntax-highlighting; should be last.
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
#fnm
eval "`fnm env --use-on-cd`"
#alias
alias setnode='node --version > .node-version'
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# Load Angular CLI autocompletion.
source <(ng completion script)

export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
 
# ZSH
export ZSH="/home/wvovaw/.oh-my-zsh"
# ZSH_THEME="awesomepanda"
COMPLETION_WAITING_DOTS="true"
# Plugins stored in ~/.oh-my-zsh/plugins/*
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
#----------------------------------------

# Load aliases
[ -f ~/.aliases ] && . ~/.aliases

# Load environment variables
[ -f ~/.environment ] && . ~/.environment

set -o vi
eval $(thefuck --alias)
eval "$(starship init zsh)"


# ZSH
export ZSH="/home/wvovaw/.oh-my-zsh"
# ZSH_THEME="awesomepanda"
COMPLETION_WAITING_DOTS="true"
# Plugins stored in ~/.oh-my-zsh/plugins/*
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
#----------------------------------------

# Set transparrency for xterm
[ -n "$XTERM_VERSION" ] && transset --id "$WINDOWID" >/dev/null


# Load aliases
[ -f ~/.aliases ] && . ~/.aliases

# Load enviroment variables
[ -f ~/.enviroment ] && . ~/.enviroment

set -o vi
eval $(thefuck --alias)
eval "$(starship init zsh)"


# ZSH
export ZSH="/home/wvovaw/.oh-my-zsh"
ZSH_THEME="awesomepanda"
COMPLETION_WAITING_DOTS="true"
# Plugins stored in ~/.oh-my-zsh/plugins/*
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
#----------------------------------------

# Vars
export EDITOR="nvim"
export TERMINAL="st"
export LOCATION="orenburg"
export PATH=$PATH:/home/wvovaw/scripts:/home/wvovaw/.local/bin:/home/wvovaw/.cargo/bin:/usr/lib/spicetify-cli

set -o vi

[ -f ~/.aliases ] && . ~/.aliases

# Set transparrency for xterm
[ -n "$XTERM_VERSION" ] && transset --id "$WINDOWID" >/dev/null

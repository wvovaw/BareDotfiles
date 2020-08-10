# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

[ -f ~/.aliases ] && . ~/.aliases
[ -n "$XTERM_VERSION" ] && transset --id "$WINDOWID" >/dev/null

export EDITOR="nvim"
export TERMINAL="st"
export LOCATION="orenburg"
export PATH=$PATH:/home/wvovaw/scripts:/home/wvovaw/.local/bin:/usr/lib/spicetify-cli

set -o vi

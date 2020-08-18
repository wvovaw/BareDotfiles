if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
#-----------------------------
# Export aliases
[ -f ~/.aliases ] && . ~/.aliases

# Export variables from zenv if exists
[ -f ~/.enviroment ] && . ~/.enviroment

set -o vi

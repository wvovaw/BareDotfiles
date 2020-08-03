# Path to your oh-my-zsh installation.
export ZSH="/home/wvovaw/.oh-my-zsh"
export EDITOR="nvim"
export TERMINAL="st"
export LOCATION="orenburg"
export BW_SESSION="7czuGSx4Ch06jzTS7h5KIr5nL6zukxmKxPY82opEVgMO52WPyBcsZ8rGJtp9Rfgw6Zeam/7p5gzux/MUBYvD0Q=="
# Add ~/scripts dir to path
export PATH=$PATH:/home/wvovaw/scripts:/home/wvovaw/.local/bin:/usr/lib/spicetify-cli
# Enable rust source ~/.cargo/env
#See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="awesomepanda"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Plugins stored in ~/.oh-my-zsh/plugins/*
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

set -o vi
# Aliases
alias wea="clear;curl wttr.in/$LOCATION"
alias wea2="curl -s 'wttr.in/$LOCATION?format=2'"
alias nv=nvim
alias tx=tmux
alias xi='sudo xbps-install'
alias xr='sudo xbps-remove'
alias xq='sudo xbps-query'
alias mm='sudo mount -t ntfs -o nls=utf8,umask=0222 /dev/sdb1 ~/Windows/X'
alias mw='sudo mount -t ntfs -o nls=utf8,umask=0222 /dev/sda4 ~/Windows/C'
alias wifi='sudo wpa_supplicant -B -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant-wlp3s0.conf'
alias music='ncmpcpp' 
alias am='alsamixer'
alias off='sudo shutdown -P now'
alias reb='sudo reboot now'
alias synctime='sudo ntpdate -u 0.ru.pool.ntp.org'
alias clear='[ $[$RANDOM % 10] = 0 ] && timeout 1 unimatrix -n -s 99 -l orCs || clear'
alias rw='randwall.sh'
alias spotify='dbus-launch --exit-with-session spotify'
alias config='/usr/bin/git --git-dir=$HOME/bareDotfiles/ --work-tree=$HOME' 

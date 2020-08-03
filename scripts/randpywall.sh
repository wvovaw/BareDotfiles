#!/bin/bash
# RWal
# Sets a random image from the PATHTOIMAGES as wallpaper.
# Also generates a colorscheme for X using pywal if -w flag pased
#
# Vladimir Ivakhno <git@wvovaw.com>
# GNU GPLv3
# Dependencies: pywall, feh, pywal

PATHTOIMAGES='/home/wvovaw/Images'
IFS=$'\n' # Helps to handle filenames and dirnames that contain spaces and other symbols
USEWAL=$1 # If -w pased then wal will be used
main() {
  RANDIMG=$(find -L $PATHTOIMAGES -type f | shuf -n 1)
  case $USEWAL in
    '-w')
      wal -i $RANDIMG
      dunstify -a 'RWal' 'Wallpaper and theme has been changed' $(echo $RANDIMG) -u low -r 4012
      ;;
    *)
      feh --bg-scale $RANDIMG
      dunstify -a 'RWal' 'Wallpaper has been changed' $(echo $RANDIMG) -u low -r 4012
      ;;
  esac
}
main

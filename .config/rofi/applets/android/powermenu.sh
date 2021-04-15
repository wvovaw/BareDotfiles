#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="$HOME/.config/rofi/applets/android"
rofi_command="rofi -theme $dir/five.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Confirmation
confirm_exit() {
  rofi -dmenu\
    -i\
    -no-fixed-num-lines\
    -p "Are You Sure? "\
    -theme $dir/confirm.rasi
  }

slock_message() {
  rofi -dmenu\
    -i\
    -no-fixed-num-lines\
    -p "Message to display: "\
    -theme $dir/textinput.rasi
  }

# Message
msg() {
  rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $chosen in
  $shutdown)
    ans=$(confirm_exit &)
    if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
      sudo shutdown -P now
    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
      exit 0
    else
      msg
    fi
    ;;
  $reboot)
    ans=$(confirm_exit &)
    if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
      sudo shutdown -r now
    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
      exit 0
    else
      msg
    fi
    ;;
  $lock)
    if [[ -f /usr/bin/i3lock ]]; then
      i3lock
    elif [[ -f /usr/bin/betterlockscreen ]]; then
      betterlockscreen -l
    elif [[ -f /usr/bin/slock ]]; then
      slock -m "$(slock_message)"
    fi
    ;;
  $suspend)
    ans=$(confirm_exit &)
    if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
      mpc -q pause
      amixer set Master mute
      sudo zzz
    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
      exit 0
    else
      msg
    fi
    ;;
  $logout)
    ans=$(confirm_exit &)
    if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
      if [[ "$DESKTOP_SESSION" == "DWM" ]]; then
        killall dwm
      elif [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
        openbox --exit
      elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
        bspc quit
      elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
        i3-msg exit
      fi
    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
      exit 0
    else
      msg
    fi
    ;;
esac

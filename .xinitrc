# Merge Xresources
xrdb -merge -I$HOME ~/.Xresources

# Composer
# exec xcompmgr -o.95 &
exec picom &

# Status bar
exec ~/Sources/dwm-bar/dwm_bar.sh &
# exec /home/wvovaw/.local/bin/dwmblocks &
#
# Run autorandr 
autorandr -c

# Restore wallpaper
exec ~/.fehbg &

# Start Dunst notifyer
exec dunst &

# Setting kb layouts
setxkbmap -layout us,ru -option grp:alt_shift_toggle

# DWM session with reload feature
# exec /bin/startdwm
# DWM with dbus working correctly
exec dbus-launch --exit-with-session dwm >/dev/null 2>&1 

# Restore the last color scheme
# wal -R

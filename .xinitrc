# Run network-manager
nm-applet &

#Merge Xresources
xrdb -merge -I$HOME ~/.Xresources

# Composer
# exec xcompmgr -o.95 &
exec picom --experimental-backends &

# Status bar
# exec ~/Sources/dwm-bar/dwm_bar.sh &
# exec /home/wvovaw/.local/bin/dwmblocks &

# Run autorandr 
autorandr -c

# Start Dunst notifyer
exec dunst &

# Add bindings for special keys in x session
xbindkeys &

# Automount usb and more
udiskie &

# Setting kb layouts
# setxkbmap -layout us,us,ru -variant ,colemak, -option grp:alt_shift_toggle
setxkbmap -layout us,ru -option grp:alt_shift_toggle

# Restore wallpaper
exec ~/.fehbg &

# Play a sound
paplay /usr/share/sounds/MIUI/stereo/desktop-screen-lock.ogg

# Run Polybar
exec ~/.config/polybar/run.sh &

# DWM session with reload feature
# exec /bin/startdwm
# DWM with dbus working correctly
exec dbus-launch --exit-with-session dwm >/dev/null 2>&1

# Restore the last color scheme
# wal -R

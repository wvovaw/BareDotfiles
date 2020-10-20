#!/usr/bin/env bash

# Wait for dwm to load
sleep 1s;
# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar left_top >>/tmp/polybar1.log 2>&1 & disown
polybar right_top >>/tmp/polybar2.log 2>&1 & disown

echo "Bars launched..."

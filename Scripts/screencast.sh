#!/bin/bash

if [[ -f $HOME/Videos/Screencasts/out.mkv  ]]; then
  n=1
  while [[ -f $HOME/Videos/Screencasts/out_$n.mkv ]];
  do
    n=$((n+1))
  done
  filename="$HOME/Videos/Screencasts/out_$n.mkv"
else
  filename="$HOME/Videos/Screencasts/out.mkv"
fi

touch $filename

ffmpeg -y \
-f x11grab \
-s 1366x768 \
-i :0.0 \
-c:v libx264 -r 30 -c:a mp3 $filename \
-f pulse -ac 2 -i alsa_output.pci-0000_00_1b.0.analog-stereo.monitor \
#-f alsa -i default \

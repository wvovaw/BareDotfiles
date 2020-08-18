#!/bin/bash
IMG = grep -E -i "*\.jpe?g|*\.png|*\.bmp|*\.gif|*\.ico|*\.raw"
[ -n $IMG] && feh $1 || /bin/firefox $1

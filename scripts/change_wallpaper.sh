#!/bin/bash
export DISPLAY=:0.0
wallpaperdir="$HOME/Pictures/Wallpapers"

randompic=$(find $wallpaperdir -maxdepth 1 -type f | shuf -n1)
echo $randompic

feh --bg-scale "$randompic"
datetime=$(date -u)
echo $datetime

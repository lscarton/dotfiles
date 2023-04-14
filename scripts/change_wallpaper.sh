#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

if [[ $1 == "cronjob" ]]; then
    export DISPLAY=:1
fi

randompic=$(find $WALLPAPER_DIR -maxdepth 1 -type f | shuf -n1)
if [[ $1 == "cronjob" ]]; then
    echo $randompic
fi

feh --bg-scale "$randompic"
datetime=$(date -u)
if [[ $1 == "cronjob" ]]; then
    echo $datetime
fi

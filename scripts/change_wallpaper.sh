#!/bin/bash
wallpaperdir="$HOME/Pictures/Wallpapers"

randompic=$(find $wallpaperdir -maxdepth 1 -type f | shuf -n1)

feh --bg-scale "$randompic"

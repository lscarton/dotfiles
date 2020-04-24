#! /bin/sh

xwinwrap -g 1366x768 -ov -ni -s -nf -- gifview -w WID ~/Pictures/gif_wallpapers/$(ls -1 ~/Pictures/gif_wallpapers | rofi -dmenu -i -fn "Monospace-13" -p "Which gif?") -a

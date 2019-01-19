#! /bin/sh

xwinwrap -g 1366x768 -ov -ni -s -nf -- gifview -w WID ~/Pictures/gif_wallpapers/$(ls -1 ~/Pictures/gif_wallpapers | dmenu -i -p "Which gif?") -a

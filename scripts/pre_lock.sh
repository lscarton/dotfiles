#!/bin/bash

scrot /tmp/screen.png

[[ -f ~/Pictures/lock_batman.png ]] &&
    convert /tmp/screen.png -scale 5% -scale 2000% -blur 0x10 ~/Pictures/lock_batman.png -gravity center -composite -matte /tmp/screenlock.png

# pause music
playerctl pause

#!/bin/bash

scrot /tmp/screen.png

[[ -f ~/Pictures/thinking.png ]] &&
    convert /tmp/screen.png -scale 5% -scale 2015% ~/Pictures/lock_batman.png -gravity center -composite -matte /tmp/screenlock.png

# pause music
playerctl pause

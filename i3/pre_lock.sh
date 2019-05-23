#!/bin/bash

scrot /tmp/screen.png

[[ -f ~/Pictures/thinking.png ]] &&
    convert /tmp/screen.png -scale 10% -scale 1000% -swirl -360 ~/Pictures/thinking.png -gravity center -composite -matte /tmp/screenlock.png

# pause music
playerctl pause

#!/bin/bash

scrot -o /tmp/screen.png

[[ -f ~/Pictures/lock.png ]] &&
    convert /tmp/screen.png -scale 5% -scale 2000% ~/Pictures/lock.png -gravity center -composite -matte /tmp/screenlock.png

## pause music
playerctl pause

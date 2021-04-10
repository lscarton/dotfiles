#!/bin/bash

if [ "$1" = "up" ]
then
    light -A 1%
    if [ "$2" = "big" ]
    then
        light -A 9%
    fi
else
    light -U 1%
    if [ "$2" = "big" ]
    then
        light -U 9%
    fi
fi

BRIGHTNESS_PERC=$(light -G)
s="Brightness level:" 
notify-send -t 500 "$s" "$BRIGHTNESS_PERC"

#!/bin/bash

if [ "$1" = "up" ]
then
    light -A 2%
    if [ "$2" = "big" ]
    then
        light -A 8%
    fi
else
    light -U 2%
    if [ "$2" = "big" ]
    then
        light -U 8%
    fi
fi

BRIGHTNESS_PERC=$(light -G)
s="Brightness level:" 
notify-send -t 500 "$s" "$BRIGHTNESS_PERC"

#!/bin/bash

# check if there are multiple connected outputs or not
screen=$( xrandr | grep " connected" | wc -l )
# if 2 connected outputs, make HDMI same as normal display
if [[ $screen -eq 2 ]]
then
    choice=$(printf "Enable\nDisable\n" | dmenu -i -p "What should be done with second screen?")
    if [[ "$choice" = "Enable" ]]
    then
        xrandr --output HDMI-1 --mode 1360x768 --same-as eDP-1
    else
        xrandr --output HDMI-1 --off
    fi
# else turn HDMI off
else
    xrandr --output HDMI-1 --off
fi

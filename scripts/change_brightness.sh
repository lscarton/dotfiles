#!/bin/bash

if [[ -f ~/.config/display_name && -f ~/.config/brightness ]]; then
    echo "present"
else
    echo "Display name not known or brightness file missing"
    exit 1
fi

BRIGHTNESS="$(cat ~/.config/brightness)"
if [ "$1" = "up" ]
then
    BRIGHTNESS=$(echo "$BRIGHTNESS+0.05" | bc)
    if [ "$(echo "$BRIGHTNESS > 1.0" | bc)" -eq 1 ]; then
        BRIGHTNESS='1.0'
    fi
else
    BRIGHTNESS=$(echo "$BRIGHTNESS-0.05" | bc)
    if [ "$(echo "$BRIGHTNESS < 0.0" | bc)" -eq 1 ]; then
        BRIGHTNESS='0.0'
    fi
fi
DISPLAY_NAME="$(cat ~/.config/display_name)"
xrandr --output $DISPLAY_NAME --brightness $BRIGHTNESS
echo $BRIGHTNESS > ~/.config/brightness

BRIGHTNESS_PERC=$(echo "$BRIGHTNESS*100" | bc)
s="Brightness level:" 
notify-send -t 500 "$s" "$BRIGHTNESS_PERC"

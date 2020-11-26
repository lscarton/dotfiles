#!/bin/bash

choices="Yes\nNo"
chosen=$(echo -e $choices | rofi -dmenu -i -color-normal "#ff0000" -p "Exit i3?")
if [ "$chosen" == "Yes" ]; then
    i3-msg exit
fi

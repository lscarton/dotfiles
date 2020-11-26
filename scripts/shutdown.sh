#!/bin/bash

choices="Yes\nNo"
chosen=$(echo -e $choices | rofi -dmenu -i -color-normal "#ff0000" -p "Shutdown?")
if [ "$chosen" == "Yes" ]; then
    shutdown now
fi

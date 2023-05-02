#!/bin/bash

INTERNAL_OUTPUT="eDP-1"
EXTERNAL_OUTPUT=$(xrandr | grep ' connected ' | awk '{print $1}' | grep -v $INTERNAL_OUTPUT)

# if no external output connected; reset to default
if [[ $EXTERNAL_OUTPUT == "" ]]; then
    outputs=$(xrandr | grep ' disconnected ' | awk '{print $1}')
    echo "${outputs}"
    notify-send "Screen Configuration" "LAPTOP (default)"
    xrandr --output $INTERNAL_OUTPUT --auto --primary
    for output in ${outputs}; do
        echo "$output"
        xrandr --output $output --off
    done
fi

# if external output is connected; provide options
if [ `xrandr | grep $EXTERNAL_OUTPUT | grep -c ' connected '` -eq 1 ]; then

    choices="laptop\ndual\nexternal\nclone"

    chosen=$(echo -e $choices | rofi -dmenu -i -fn "Monospace-13" -p "which configuration?")
    case "$chosen" in
        external)
            xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto --primary
            notify-send "Screen Configuration" "EXTERNAL"
            ;;
        laptop)
            xrandr --output $INTERNAL_OUTPUT --auto --primary --output $EXTERNAL_OUTPUT --off
            notify-send "Screen Configuration" "LAPTOP"
            ;;
        clone)
            resolution=$(xrandr | grep -m 1 '*+' | awk '{print $1}')
            echo $resolution
            xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --scale-from $resolution
            notify-send "Screen Configuration" "CLONE"
            ;;
        dual)
            xrandr --output $INTERNAL_OUTPUT --auto --primary --output $EXTERNAL_OUTPUT --auto --above $INTERNAL_OUTPUT
            notify-send "Screen Configuration" "DUAL"
            ;;
    esac
else
    xrandr --output $INTERNAL_OUTPUT --auto --primary --output $EXTERNAL_OUTPUT --off
    notify-send "Screen Configuration" "LAPTOP (default)"
fi


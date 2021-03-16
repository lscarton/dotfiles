#!/bin/bash

INTERNAL_OUTPUT="eDP-1-1"
EXTERNAL_OUTPUT="HDMI-0"

# Detect extenal monitor
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
            xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT --primary
            notify-send "Screen Configuration" "DUAL"
            ;;
    esac
else
    xrandr --output $INTERNAL_OUTPUT --auto --primary --output $EXTERNAL_OUTPUT --off
    notify-send "Screen Configuration" "LAPTOP (default)"
fi


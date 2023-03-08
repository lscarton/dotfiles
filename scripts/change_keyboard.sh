#!/bin/bash

choices="English\nGerman"

chosen=$(echo -e $choices | rofi -dmenu -i -fn "Monospace-13" -p "which language?")
case "$chosen" in
    English)
        setxkbmap -layout us
        xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
        notify-send "Keyboard layout" "English (us)"
        ;;
    German)
        setxkbmap -layout de
        xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
        notify-send "Keyboard layout" "German (de)"
        ;;
esac

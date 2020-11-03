#!/bin/bash
if [ "$1" = "up" ]
then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [ "$1" = "down" ]
then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [ "$1" = "mute" ]
then
    pactl set-sink-mute @DEFAULT_SINK@ toggle # mute sound
else
    notify-send -i dialog-error "Change volume" "Unknown argument"
fi

volume_string="$(bash /usr/share/i3blocks/volume 5 pulse)"
s="Volume level:" 
if [ "$volume_string" = "MUTE" ]
then
    icon="audio-volume-muted"
else
    num_of_char=$(wc -c <<< $volume_string)
    num_of_digits=$(( num_of_char-2 ))
    volume="$(cut -c -$num_of_digits <<< $volume_string)"
    if [ $volume -gt 70 ]
    then
        icon="audio-volume-high"
    elif [ $volume -lt 25 ]
    then
        icon="audio-volume-low"
    else
        icon="audio-volume-medium"
    fi
fi
notify-send -t 500 -i "$icon" "$s" "$volume_string" -h string:x-canonical-private-synchronous:anything

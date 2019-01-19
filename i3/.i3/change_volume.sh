#!/bin/bash
if [ "$1" = "up" ]
then
    pactl set-sink-volume 1 +5%
else
    pactl set-sink-volume 1 -5%
fi

volume="$(bash /usr/share/i3blocks/volume 5 pulse)"
s="Volume level:" 
notify-send "$s" "$volume" -h string:x-canonical-private-synchronous:anything

#!/bin/bash
if [ "$1" = "up" ]
then
    light -A 5
else
    light -U 5
fi

brightness="$(light -G -p)"
s="Brightness level:" 
echo $s
#notify-send -u low "$s"
notify-send "$s" "$brightness" -h string:x-canonical-private-synchronous:anything

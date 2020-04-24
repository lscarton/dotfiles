#!/bin/bash
if [ "$1" = "up" ]
then
    xbacklight -inc 2.5
else
    xbacklight -dec 2.5
fi

brightness="$(xbacklight -get)"
s="Brightness level:" 
echo $s
#notify-send -u low "$s"
notify-send "$s" "$brightness" -h string:x-canonical-private-synchronous:anything

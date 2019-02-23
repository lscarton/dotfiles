#!/bin/bash

# # check if there are multiple connected outputs or not
# screen=$( xrandr | grep " connected" | wc -l )
# # if 2 connected outputs, make HDMI same as normal display
# if [[ $screen -eq 2 ]]
# then
#     choice=$(printf "Enable\nDisable\n" | dmenu -i -p "What should be done with second screen?")
#     if [[ "$choice" = "Enable" ]]
#     then
#         xrandr --output HDMI-1 --mode 1360x768 --same-as eDP-1
#     else
#         xrandr --output HDMI-1 --off
#     fi
# # else turn HDMI off
# else
#     xrandr --output HDMI-1 --off
# fi

#!/bin/bash

INTERNAL_OUTPUT="eDP1"

choices="laptop\ndual\nexternal\nclone"

chosen=$(echo -e $choices | rofi -dmenu -i -fn "Monospace-13" -p "which configuration?")

# Detect extenal monitor
if [ `xrandr | grep HDMI1 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="HDMI1"
fi

case "$chosen" in
    external) xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto --primary ;;
    laptop) xrandr --output $INTERNAL_OUTPUT --auto --primary --output $EXTERNAL_OUTPUT --off ;;
    clone) xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT ;;
    dual) xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT --primary ;;
esac

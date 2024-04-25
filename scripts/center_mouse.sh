#! /bin/bash

focused_window_id="$(xdotool getwindowfocus)"

# following line defines variables "WINDOW", "X", "Y", "WIDTH", "HEIGHT" and "SCREEN"
eval "$(xdotool getwindowgeometry --shell $focused_window_id)"

# When no window is focused
if [[ $X == "-1" || $Y == "-1" ]]; then
    exit 0
fi

target_x=$(($WIDTH / 2))
target_y=$(($HEIGHT / 2))
xdotool mousemove --window $focused_window_id $target_x $target_y

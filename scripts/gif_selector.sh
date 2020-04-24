#! /bin/bash

screen_width=1366
screen_height=768
# get gif from a specific folder
gif_name=$HOME/Pictures/gif_wallpapers/$(ls -1 ~/Pictures/gif_wallpapers | rofi -dmenu -i -fn "Monospace-13" -p "Which gif?")

# get width and height of selected gif
file_output="$(file $gif_name -b)"
IFS=','; arrIN=($file_output); unset IFS;
size="${arrIN[2]}"
IFS='x'; arrIN=($size); unset IFS;
width="${arrIN[0]}"
height="${arrIN[1]}"

# set a bg based on the first frame of the gif
convert "$gif_name""[0]" /tmp/gif_bg.png
convert /tmp/gif_bg.png -scale 10% -scale 1366x768 /tmp/gif_bg.png
convert /tmp/gif_bg.png -blur 0x50 /tmp/gif_bg.png
feh --bg-scale /tmp/gif_bg.png
rm /tmp/gif_bg.png

# calculate offset for the selected gif based on screen size
width=$(($width))
height=$(($height))
width_offset=$(($screen_width/2 - $width/2))
height_offset=$(($screen_height/2 - $height/2))

# start xwinwrap to loop selected gif as background
xwinwrap -g "$width""x""$height""+""$width_offset""+""$height_offset" -ov -ni -s -nf -- gifview -w WID $gif_name -a

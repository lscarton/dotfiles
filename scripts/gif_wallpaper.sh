#!bin/sh

case $BLOCK_BUTTON in 
    1) notify-send "Press mod + g to start GIF background";;

    3) kill `pgrep xwinwrap`; feh --bg-scale ~/Pictures/Wallpapers/blue_material_design.jpg;;
esac

echo "GIF"

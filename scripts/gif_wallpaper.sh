#!bin/sh

case $BLOCK_BUTTON in 
    1) notify-send "Press mod + g to start GIF background";;

    3) kill `pgrep xwinwrap` ;;
esac

echo "GIF"

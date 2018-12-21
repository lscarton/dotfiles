#!bin/sh

case $BLOCK_BUTTON in 
#     1) ~/.i3/gif_selector.sh ;;

    3) kill `pgrep xwinwrap` ;;
#     3) echo "Right click action" ;;
esac

echo "GIF"

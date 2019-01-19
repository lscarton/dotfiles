#!bin/sh

case $BLOCK_BUTTON in 
    1) notify-send --icon=gtk-info "Top CPU using processes" "$(ps axch -o cmd:15,%cpu --sort=-%cpu | head)" -h string:x-canonical-private-synchronous:anything;;
#     3) echo "Right click action" ;;
esac

echo "CPU"

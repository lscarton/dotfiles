#!bin/sh

case $BLOCK_BUTTON in 
    1) notify-send --icon=gtk-info "Top Memory using processes" "$(ps axch -o cmd:15,%mem --sort=-%mem | head)" -h string:x-canonical-private-synchronous:anything;;
#     3) echo "Right click action" ;;
esac

free -h | awk '/Mem:/ {print $3}'

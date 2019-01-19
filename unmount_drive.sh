#!/bin/bash

# get unmountable drives from lsblk command and exclude /, /home and /boot from that list
exclusionregex="\(/boot\|/home\|/\)$"
unmountable=$(lsblk -lp | grep "part /" | grep -v "$exclusionregex" | awk '{print $1, "(" $4 ")"}')
[[ "$unmountable" = "" ]] && exit 1

# ask user to choose a drive to be unmounted
chosen=$(echo "$unmountable" | dmenu -i -p "Unmount which drive?" | awk '{print $1}')
[[ "$chosen" = "" ]] && exit 1

# mount chosen drive to the chosen mountpoint
sudo umount $chosen && notify-send "$chosen unmounted"

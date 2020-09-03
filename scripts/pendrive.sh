#!/bin/bash

# ask user to choose between mounting and unmounting
operation=$(echo -e "Mount\nUnmount" | rofi -dmenu -i -p "Which operation? ")

if [ "$operation" = "Mount" ];then
    # get mountable drives from lsblk command
    mountable=$(lsblk -lp | grep "part $" | awk '{print $1, "(" $4 ")"}')
    [[ "$mountable" = "" ]] && exit 1

    # ask user to choose a mountable drive
    chosen=$(echo "$mountable" | rofi -dmenu -i -fn "Monospace-13" -p "Mount which drive?" | awk '{print $1}')
    [[ "$chosen" = "" ]] && exit 1

    # get list of directories where the drive could be mounted
    dirs=$(find /media /mnt 2>/dev/null)
    # ask user to select a mount point
    mountpoint=$(echo "$dirs" | rofi -dmenu -i -fn "Monospace-13" -p "Where do you want to mount "$chosen"?" )
    [[ "$mountpoint" = "" ]] && exit 1

    # create a directory if it does not exist
    if [[ ! -d "$mountpoint" ]]; then
        sudo mkdir -p "$mountpoint"
    fi

    # mount chosen drive to the chosen mountpoint
    sudo mount $chosen $mountpoint && notify-send "$chosen mounted to $mountpoint"
else
    # get unmountable drives from lsblk command and exclude /, /home and /boot from that list
    exclusionregex="\(/boot\|/home\|/\)$"
    unmountable=$(lsblk -lp | grep "part /" | grep -v "$exclusionregex" | awk '{print $1, "(" $4 ")"}')
    [[ "$unmountable" = "" ]] && exit 1

    # ask user to choose a drive to be unmounted
    chosen=$(echo "$unmountable" | rofi -dmenu -i -fn "Monospace-13" -p "Unmount which drive?" | awk '{print $1}')
    [[ "$chosen" = "" ]] && exit 1

    # mount chosen drive to the chosen mountpoint
    sudo umount $chosen && notify-send "$chosen unmounted"
fi

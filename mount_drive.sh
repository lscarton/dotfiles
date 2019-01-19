#!/bin/bash

# get mountable drives from lsblk command
mountable=$(lsblk -lp | grep "part $" | awk '{print $1, "(" $4 ")"}')
[[ "$mountable" = "" ]] && exit 1

# ask user to choose a mountable drive
chosen=$(echo "$mountable" | dmenu -i -p "Mount which drive?" | awk '{print $1}')
[[ "$chosen" = "" ]] && exit 1

# get list of directories where the drive could be mounted
dirs=$(find /media -type d -mindepth 1 -maxdepth 2 2>/dev/null)
# ask user to select a mount point
mountpoint=$(echo "$dirs" | dmenu -i -p "Where do you want to mount "$chosen"?" )
[[ "$mountpoint" = "" ]] && exit 1

# create a directory if it does not exist
if [[ ! -d "$mountpoint" ]]; then
    sudo mkdir -p "$mountpoint"
fi

# mount chosen drive to the chosen mountpoint
sudo mount $chosen $mountpoint && notify-send "$chosen mounted to $mountpoint"

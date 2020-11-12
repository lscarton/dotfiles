#!/bin/bash

# ask user to choose which wireless network to connect to
choice=$(nmcli connection show | awk 'NR>1 {print $1 "\t" $2}'| rofi -dmenu -i -p "Which network? ")
network_uuid=$(echo $choice | awk '{print $2}')

# connect to selected network
nmcli connection up uuid $network_uuid

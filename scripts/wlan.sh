#!/bin/bash

# ask user to choose which wireless network to connect to
choice=$(wicd-cli -ySl | awk 'NR>1 && NR<5 {print $1 " " $4}' | rofi -dmenu -i -p "Which network? ")
network_id=$(echo "${choice%% *}")

# connect to selected network
wicd-cli -y -n"${network_id}" -c

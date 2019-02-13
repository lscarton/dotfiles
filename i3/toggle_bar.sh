#! /usr/bin/sh

# check if bar is hidden or not
output=$(i3-msg -t get_bar_config bar-0 | grep -c "\"mode\":\"hide\"")

# if bar is not hidden, then hide it otherwise dock it
if [[ $output -eq 0 ]]; then
    i3-msg -t command "bar mode hide"
else 
    i3-msg -t command "bar mode dock"
fi

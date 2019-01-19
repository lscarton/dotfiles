while true; do
    percentage="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage)"
    perc="$(cut -c 13- <<< $percentage)"
    char=$(wc -c <<< $perc)
    a=$(( char-2 ))
    actual="$(cut -c -$a <<< $perc)"
    echo $actual
    if [ $actual -lt 20 ] 
    then
        notify-send "LOW BATTERY" "$perc"
    fi
    sleep 120
done

while true; do
    percentage_string="$(acpi -b | awk '/Battery 0:/ {print $4}')"
    num_of_char=$(wc -c <<< $percentage_string)
    num_of_digits=$(( num_of_char-3 ))
    percentage="$(cut -c -$num_of_digits <<< $percentage_string)"
    echo $percentage
    if [ $percentage -lt 80 ] 
    then
        notify-send -i battery-low -u critical "LOW BATTERY" "$percentage"
        sleep 15
    else
        sleep 120
    fi
done

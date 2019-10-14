while true; do
    percentage_string="$(acpi -b | awk '/Battery 0:/ {print $4}')"
    num_of_char=$(wc -c <<< $percentage_string)
    IFS='%'; arrIN=($percentage_string); unset IFS;
    for i in "${arrIN[@]}"; do
        echo $i
        percentage="$i"
        break
    done
    if [ $percentage -lt 30 ] 
    then
        notify-send -i battery-low -u critical "LOW BATTERY" "$percentage"
        sleep 15
    else
        sleep 120
    fi
done

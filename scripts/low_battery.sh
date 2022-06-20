while true; do
    percentage_string="$(acpi -b | awk '/Battery 0:/ {print $4}')"
    num_of_char=$(wc -c <<< $percentage_string)
    IFS='%'; arrIN=($percentage_string); unset IFS;
    for i in "${arrIN[@]}"; do
        echo $i
        percentage="$i"
        break
    done
    acpi_output="$(acpi -b)"
    if [ $percentage -lt 30 ]; then
        if [[ $acpi_output == *"Discharging"* ]]; then
            notify-send -i battery-low -u critical "LOW BATTERY" "$percentage"
        fi
        sleep 120
    else
        if [ $percentage -gt 95 ]; then
            if [[ $acpi_output == *"Charging"* ]]; then
                notify-send -i battery-low -u low "BATTERY CHARGED" "$percentage"
            fi
        fi
        sleep 300
    fi
done

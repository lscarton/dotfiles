#! /bin/bash
if [[ $1 == "-t" ]]; then
    echo "time"
    args=$@
    time=("${args[@]:3}")
    current_time=$(date +"%H:%M")
    echo $time
    while [[ $current_time != $time ]]; do
        sleep 5s
        current_time=$(date +"%H:%M")
    done
    i3-msg -t command "workspace 5"
    notify-send "wake up" && aplay ~/Music/Loud_Alarm_Clock_Buzzer.wav
elif [[ $1 == "-d" ]]; then
    echo "duration"
    args=$@
    time=("${args[@]:3}")
    sleep $time 
    i3-msg -t command "workspace 5"
    notify-send "wake up" && aplay ~/Music/Loud_Alarm_Clock_Buzzer.wav
else
    echo "use either -t (time in HH:MM) or -d (duration in sleep command format) option"
    echo "Example:"
    echo "    -t 15:55"
    echo "    -d 5m 5s"
fi

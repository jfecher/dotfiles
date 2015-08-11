#!/usr/bin/zsh
$(pkill -x lemonbar)

# Colors
white="#FFFFFF"
black="#181818"
blacker='#000000'
lightgrey="#444444"
red="#FF0000"
yellow="#FFFF00"
green="#32CD32"
blue="#0000FF"
# Fonts
#font="Source\ Code\ Pro\ Medium:size=10"
font="Literation\ Mono\ Powerline:size=10"

clock() {
    DATE=$(date "+%a %b %d, %r")
    echo -n "$DATE"
}

cpu(){
    cpuusage=$(mpstat | awk '/all/ {print $4 + $6}')
    echo "%{B$black}$cpuusage% CPU Used"
}

memory(){
    # Show free memory
    usedMem=$(free -m | awk '/Mem:/ {print $3}')
    totalMem=$(free -m | awk '/Mem:/ {print $2}')

    let um=$[$usedMem*100]
    let percUsed=$[$um/$totalMem]

    if [[ $percUsed -ge 75 ]]; then
        C=$red
    elif [[ $percUsed -ge 50 ]]; then
        C=$yellow
    else
        C=$green
    fi

    echo "%{R}%{B$lightgrey}%{F$lightgrey}%{B$C}%{F$blacker} $usedMem MB Used %{R}%{B$lightgrey}%{F$white}"
}


#sink name for volume which does not need to be updated every time the volume function is called
SINK_NAME=$(pacmd dump | perl -a -n -e 'print $F[1] if /set-default-sink/')

volume(){
    MUTE=`pacmd dump | grep -P "^set-sink-mute $SINK_NAME\s+" | perl -p -n -e 's/.+\s(yes|no)$/$1/'`

    if [ $MUTE = no ]; then
        VOL=`pacmd dump | grep -P "^set-sink-volume $SINK_NAME\s+" | perl -p -n -e 's/.+\s(.x.+)$/$1/'`
        VOL=$(printf '%d\n' $VOL)
        VOL=$[VOL/655]
        echo "$VOL% vol %{R}%{B$black}"
    else
        echo "mute %{R}%{B$black}"
    fi
}

windowtitle(){
    title=$(xdotool getwindowname $(xdotool getwindowfocus -f) 2>/dev/null)
    echo "%{F$white}$title" | cut -c 1-60 # Limits the output to a maximum # of chars
}

#where BATPERC = "42%", P = "42"
battery() {
    BAT=$(acpi --battery)
    BATPERC=$(echo $BAT | cut -d, -f2 | cut -d% -f1)
    CHARGING=$(echo $BAT | cut -d: -f2 | cut -d, -f1)
    TIMELEFT=$(echo $BAT | cut -d, -f3)

    if [[ $CHARGING == " Charging" ]]; then
        C=$blue
    elif [[ $BATPERC -le 5 ]]; then
    	C=$red
    elif [[ $BATPERC -le 15 ]]; then
    	C=$yellow
    else
    	C=$green
    fi

    echo "%{R}%{B$lightgrey}%{R}%{B$C}%{F$blacker}$BATPERC% %{R}%{B$lightgrey}%{F$white}$TIMELEFT %{R}%{B$black}%{F$white}"
}


while :; do
    echo "%{l}%{B$black}$(cpu) $(memory) $(volume)%{c}$(windowtitle)%{r}%{B$black}$(battery)%{B$black} $(clock)"
    sleep 1s
done |

# Finally, launches bar while piping the above while loop!
# | bash is needed on the end for the click events to work.
lemonbar -g x14 -f $font

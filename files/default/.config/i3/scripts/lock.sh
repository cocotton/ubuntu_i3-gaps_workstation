#!/bin/bash

icon=$1
tmpbg="/tmp/lock_screen.png"

scrot "$tmpbg"
convert "$tmpbg" -scale 2.5% -scale 4000% "$tmpbg"

if [[ -f "$icon" ]]
then
    # placement x/y
    PX=0
    PY=0
    # lockscreen image info
    R=$(file "$icon" | grep -o '[0-9]* x [0-9]*')
    RX=$(echo $R | cut -d' ' -f 1)
    RY=$(echo $R | cut -d' ' -f 3)

    SR=$(xrandr --listactivemonitors | cut -f4 -d' ')
    for RES in $SR
    do
        # monitor position/offset
        SRX=$(echo $RES | cut -d '/' -f 1)                   # x pos
        SRY=$(echo $RES | cut -d '/' -f 2 | cut -d 'x' -f 2)  # y pos
        SROX=$(echo $RES | cut -d '/' -f 3 | cut -d '+' -f 2) # x offset
        SROY=$(echo $RES | cut -d '/' -f 3 | cut -d '+' -f 3) # y offset
        PX=$(($SROX + $SRX/2 - $RX/2))
        PY=$(($SROY + $SRY/2 - $RY/2))

        convert "$tmpbg" "$icon" -geometry +$PX+$PY -composite -matte  "$tmpbg"
    done

fi
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock -e -u -n -i "$tmpbg"
rm $tmpbg

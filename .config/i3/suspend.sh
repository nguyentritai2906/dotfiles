#!/bin/bash

#Capture then pixelate the image to use as lock screen
scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png

#Add the lock icon the image
if [[ -f $HOME/Pictures/icons/lock-green-20.png ]]
then
    # placement x/y
    PX=0
    PY=0
    # lockscreen image info
    R=$(file ~/Pictures/icons/lock-green-20.png | grep -o '[0-9]* x [0-9]*')
    RX=$(echo $R | cut -d' ' -f 1)
    RY=$(echo $R | cut -d' ' -f 3)

    SR=$(xrandr --query | grep ' connected' | cut -f3 -d' ')
    for RES in $SR
    do
        # monitor position/offset
        SRX=$(echo $RES | cut -d'x' -f 1)                   # x pos
        SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
        SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
        SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset
        PX=$(($SROX + $SRX/2 - $RX/2))
        PY=$(($SROY + $SRY/2 - $RY/2))

        convert /tmp/screen.png $HOME/Pictures/icons/lock-green-20.png -geometry +$PX+$PY -composite -matte  /tmp/screen.png
        echo "done"
    done
fi

#Lock the machine using above image then remove it
i3lock -e -u -n -i /tmp/screen.png
rm /tmp/screen.png

#Suspend
systemctl suspend

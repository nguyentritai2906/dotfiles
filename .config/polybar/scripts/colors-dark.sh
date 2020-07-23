#!/bin/bash

## Author : Aditya Shakya
## Github : adi1090x

PDIR="$HOME/.config/polybar"
LAUNCH="polybar-msg cmd restart"

if  [[ $1 = "-amber" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #ffb300/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ffb300"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ffb300"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ffb300"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ffb300"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-blue" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #6272a4/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#6272a4"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#6272a4"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#6272a4"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#6272a4"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-blue-grey" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #546e7a/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#546e7a"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#546e7a"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#546e7a"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#546e7a"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-brown" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #6d4c41/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#6d4c41"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#6d4c41"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#6d4c41"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#6d4c41"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-cyan" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #8be9fd/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#8be9fd"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#8be9fd"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#8be9fd"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#8be9fd"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-deep-orange" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #f4511e/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#f4511e"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#f4511e"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#f4511e"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#f4511e"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-deep-purple" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #5e35b1/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#5e35b1"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#5e35b1"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#5e35b1"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#5e35b1"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-green" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #43a047/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#43a047"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#43a047"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#43a047"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#43a047"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-grey" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #757575/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#757575"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#757575"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#757575"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#757575"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-indigo" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #3949ab/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#3949ab"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#3949ab"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#3949ab"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#3949ab"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-light-blue" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #039be5/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#039be5"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#039be5"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#039be5"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#039be5"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-light-green" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #50fa7b/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#50fa7b"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#50fa7b"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#50fa7b"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#50fa7b"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-lime" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #c0ca33/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#c0ca33"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#c0ca33"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#c0ca33"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#c0ca33"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-orange" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #ffb86c/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ffb86c"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ffb86c"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ffb86c"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ffb86c"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-pink" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #ff79c6/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ff79c6"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ff79c6"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ff79c6"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ff79c6"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-purple" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #bd93f9/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#bd93f9"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#bd93f9"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#bd93f9"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#bd93f9"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-red" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #ff5555/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ff5555"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ff5555"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ff5555"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#ff5555"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-teal" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #00897b/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#00897b"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#00897b"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#00897b"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#00897b"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

elif  [[ $1 = "-yellow" ]]; then
# Replacing colors
sed -i -e 's/bg = .*/bg = #1F1F1F/g' $PDIR/config.ini
sed -i -e 's/fg = .*/fg = #FFFFFF/g' $PDIR/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #A9ABB0/g' $PDIR/config.ini
sed -i -e 's/acolor = .*/acolor = #f1fa8c/g' $PDIR/config.ini
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#f1fa8c"/g' $PDIR/scripts/menu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#f1fa8c"/g' $PDIR/scripts/menu_full
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#f1fa8c"/g' $PDIR/scripts/sysmenu
sed -i -e 's/HIGHLIGHT_BACKGROUND=.*/HIGHLIGHT_BACKGROUND="#f1fa8c"/g' $PDIR/scripts/color-switch.sh
# Restarting polybar
$LAUNCH &

else
echo "Available options:
-amber		-blue			-blue-grey		-brown
-cyan		-deep-orange		-deep-purple		-green
-grey		-indigo			-light-blue		-light-green
-lime		-orange			-pink			-purple
-red		-teal			-yellow"
fi

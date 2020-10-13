#!/bin/bash

## Author : Aditya Shakya
## Github : adi1090x
# Custom Rofi Script

BORDER="#1F1F1F"
SEPARATOR="#1F1F1F"
FOREGROUND="#FFFFFF"
BACKGROUND="#1F1F1F"
BACKGROUND_ALT="#252525"
HIGHLIGHT_BACKGROUND="#8be9fd"
HIGHLIGHT_FOREGROUND="#1F1F1F"

BLACK="#000000"
WHITE="#ffffff"
RED="#e53935"
GREEN="#43a047"
YELLOW="#fdd835"
BLUE="#1e88e5"
MAGENTA="#00897b"
CYAN="#00acc1"
PINK="#d81b60"
PURPLE="#8e24aa"
INDIGO="#3949ab"
TEAL="#00897b"
LIME="#c0ca33"
AMBER="#ffb300"
ORANGE="#fb8c00"
BROWN="#6d4c41"
GREY="#757575"
BLUE_GREY="#546e7a"
DEEP_PURPLE="#5e35b1"
DEEP_ORANGE="#f4511e"
LIGHT_BLUE="#039be5"
LIGHT_GREEN="#7cb342"

SDIR="$HOME/.config/polybar/scripts"

# Launch Rofi
MENU="$(rofi -matching fuzzy -no-lazy-grab -sep "|" -dmenu -i -p 'Style ' \
-hide-scrollbar true \
-color-enabled true \
-color-window "$BACKGROUND,$BORDER,$SEPARATOR" \
-color-normal "$BACKGROUND_ALT,$FOREGROUND,$BACKGROUND_ALT,$HIGHLIGHT_BACKGROUND,$HIGHLIGHT_FOREGROUND" \
-color-active "$BACKGROUND,$MAGENTA,$BACKGROUND_ALT,$HIGHLIGHT_BACKGROUND,$HIGHLIGHT_FOREGROUND" \
-color-urgent "$BACKGROUND,$YELLOW,$BACKGROUND_ALT,$HIGHLIGHT_BACKGROUND,$HIGHLIGHT_FOREGROUND" \
<<< "♥ amber|♥ blue|♥ blue-grey|♥ brown|♥ cyan|♥ deep-orange|♥ deep-purple|♥ green|♥ grey|♥ indigo|♥ blue-light|♥ green-light|♥ lime|♥ orange|♥ pink|♥ purple|♥ red|♥ teal|♥ yellow|♥ amber-dark|♥ blue-dark|♥ blue-grey-dark|♥ brown-dark|♥ cyan-dark|♥ deep-orange-dark|♥ deep-purple-dark|♥ green-dark|♥ grey-dark|♥ indigo-dark|♥ blue-light-dark|♥ green-light-dark|♥ lime-dark|♥ orange-dark|♥ pink-dark|♥ purple-dark|♥ red-dark|♥ teal-dark|♥ yellow-dark")"
case "$MENU" in
    ## Light Colors
    *amber) $SDIR/colors-light.sh -amber && $HOME/.config/polybar/scripts/acolor.sh;;
    *blue) $SDIR/colors-light.sh -blue && $HOME/.config/polybar/scripts/acolor.sh;;
    *blue-grey) $SDIR/colors-light.sh -blue-grey && $HOME/.config/polybar/scripts/acolor.sh;;
    *brown) $SDIR/colors-light.sh -brown && $HOME/.config/polybar/scripts/acolor.sh;;
    *cyan) $SDIR/colors-light.sh -cyan && $HOME/.config/polybar/scripts/acolor.sh;;
    *deep-orange) $SDIR/colors-light.sh -deep-orange && $HOME/.config/polybar/scripts/acolor.sh;;
    *deep-purple) $SDIR/colors-light.sh -deep-purple && $HOME/.config/polybar/scripts/acolor.sh;;
    *green) $SDIR/colors-light.sh -green && $HOME/.config/polybar/scripts/acolor.sh;;
    *grey) $SDIR/colors-light.sh -grey && $HOME/.config/polybar/scripts/acolor.sh;;
    *indigo) $SDIR/colors-light.sh -indigo && $HOME/.config/polybar/scripts/acolor.sh;;
    *blue-light) $SDIR/colors-light.sh -light-blue && $HOME/.config/polybar/scripts/acolor.sh;;
    *green-light) $SDIR/colors-light.sh -light-green && $HOME/.config/polybar/scripts/acolor.sh;;
    *lime) $SDIR/colors-light.sh -lime && $HOME/.config/polybar/scripts/acolor.sh;;
    *orange) $SDIR/colors-light.sh -orange && $HOME/.config/polybar/scripts/acolor.sh;;
    *pink) $SDIR/colors-light.sh -pink && $HOME/.config/polybar/scripts/acolor.sh;;
    *purple) $SDIR/colors-light.sh -purple && $HOME/.config/polybar/scripts/acolor.sh;;
    *red) $SDIR/colors-light.sh -red && $HOME/.config/polybar/scripts/acolor.sh;;
    *teal) $SDIR/colors-light.sh -teal && $HOME/.config/polybar/scripts/acolor.sh;;
    *yellow) $SDIR/colors-light.sh -yellow && $HOME/.config/polybar/scripts/acolor.sh;;
    ## Dark Colors
    *amber-dark) $SDIR/colors-dark.sh -amber && $HOME/.config/polybar/scripts/acolor.sh;;
    *blue-dark) $SDIR/colors-dark.sh -blue && $HOME/.config/polybar/scripts/acolor.sh;;
    *blue-grey-dark) $SDIR/colors-dark.sh -blue-grey && $HOME/.config/polybar/scripts/acolor.sh;;
    *brown-dark) $SDIR/colors-dark.sh -brown && $HOME/.config/polybar/scripts/acolor.sh;;
    *cyan-dark) $SDIR/colors-dark.sh -cyan && $HOME/.config/polybar/scripts/acolor.sh;;
    *deep-orange-dark) $SDIR/colors-dark.sh -deep-orange && $HOME/.config/polybar/scripts/acolor.sh;;
    *deep-purple-dark) $SDIR/colors-dark.sh -deep-purple && $HOME/.config/polybar/scripts/acolor.sh;;
    *green-dark) $SDIR/colors-dark.sh -green && $HOME/.config/polybar/scripts/acolor.sh;;
    *grey-dark) $SDIR/colors-dark.sh -grey && $HOME/.config/polybar/scripts/acolor.sh;;
    *indigo-dark) $SDIR/colors-dark.sh -indigo && $HOME/.config/polybar/scripts/acolor.sh;;
    *blue-light-dark) $SDIR/colors-dark.sh -light-blue && $HOME/.config/polybar/scripts/acolor.sh;;
    *green-light-dark) $SDIR/colors-dark.sh -light-green && $HOME/.config/polybar/scripts/acolor.sh;;
    *lime-dark) $SDIR/colors-dark.sh -lime && $HOME/.config/polybar/scripts/acolor.sh;;
    *orange-dark) $SDIR/colors-dark.sh -orange && $HOME/.config/polybar/scripts/acolor.sh;;
    *pink-dark) $SDIR/colors-dark.sh -pink && $HOME/.config/polybar/scripts/acolor.sh;;
    *purple-dark) $SDIR/colors-dark.sh -purple && $HOME/.config/polybar/scripts/acolor.sh;;
    *red-dark) $SDIR/colors-dark.sh -red && $HOME/.config/polybar/scripts/acolor.sh;;
    *teal-dark) $SDIR/colors-dark.sh -teal && $HOME/.config/polybar/scripts/acolor.sh;;
    *yellow-dark) $SDIR/colors-dark.sh -yellow && $HOME/.config/polybar/scripts/acolor.sh
esac

#$HOME/.config/polybar/scripts/acolor.sh

#!/bin/bash

xres="$HOME/.Xresources"
tmux="$HOME/.tmux.conf.local"
rasifile="$HOME/.config/rofi/global.rasi"

accent=$(awk '/^acolor/{print $3}' $HOME/.config/polybar/config.ini)

sed -i --follow-symlinks "/accent:/c\accent: $accent\;" "$rasifile"
sed -i --follow-symlinks "/acolor/c\\*acolor: $accent" "$xres"
sed -i --follow-symlinks "/^acolor/c\\acolor='$accent'" "$tmux"
i3 reload

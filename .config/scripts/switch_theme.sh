#!/usr/bin/env sh

ALACRITTY_LIGHT="catppuccin_light.yaml"
ALACRITTY_DARK="catppuccin_dark.yaml"

TMUX_LIGHT="catppuccin_light.conf"
TMUX_DARK="catppuccin_dark.conf"

ALACRITTY_CURRENT=$(/Users/mater/Library/Python/3.9/bin/alacritty-colorscheme status)
SYSTEM_CURRENT=$(defaults read -g AppleInterfaceStyle)

if [ $ALACRITTY_CURRENT = $ALACRITTY_DARK ] && [ x$SYSTEM_CURRENT != 'xDark' ]; then
    # Switch to light theme
    /opt/homebrew/opt/gsed/libexec/gnubin/sed -i "s/$TMUX_DARK/$TMUX_LIGHT/" $HOME/.tmux/.tmux.conf > /dev/null && /opt/homebrew/bin/tmux source $HOME/.tmux.conf > /dev/null;
    $HOME/Library/Python/3.9/bin/alacritty-colorscheme apply $ALACRITTY_LIGHT;
elif [ $ALACRITTY_CURRENT = $ALACRITTY_LIGHT ] && [ x$SYSTEM_CURRENT = 'xDark' ]; then
    # Switch to dark theme
    /opt/homebrew/opt/gsed/libexec/gnubin/sed -i "s/$TMUX_LIGHT/$TMUX_DARK/" $HOME/.tmux/.tmux.conf > /dev/null && /opt/homebrew/bin/tmux source $HOME/.tmux.conf > /dev/null;
    $HOME/Library/Python/3.9/bin/alacritty-colorscheme apply $ALACRITTY_DARK;
fi

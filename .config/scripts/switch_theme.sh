#!/usr/bin/env sh

ALACRITTY_LIGHT="catppuccin_latte.toml"
ALACRITTY_DARK="catppuccin_macchiato.toml"

TMUX_LIGHT="catppuccin_light.conf"
TMUX_DARK="catppuccin_dark.conf"

SYSTEM_CURRENT=$(defaults read -g AppleInterfaceStyle)

if [ x$SYSTEM_CURRENT != 'xDark' ]; then
	# Switch to light theme
	/opt/homebrew/opt/gsed/libexec/gnubin/sed -i "s/$TMUX_DARK/$TMUX_LIGHT/" $HOME/.tmux/.tmux.conf >/dev/null && /opt/homebrew/bin/tmux source $HOME/.tmux.conf >/dev/null
	/opt/homebrew/opt/gsed/libexec/gnubin/sed -i "s/$ALACRITTY_DARK/$ALACRITTY_LIGHT/" $HOME/.config/alacritty/alacritty.toml >/dev/null
	# $HOME/Library/Python/3.9/bin/alacritty-colorscheme apply $ALACRITTY_LIGHT
elif [ x$SYSTEM_CURRENT = 'xDark' ]; then
	# Switch to dark theme
	/opt/homebrew/opt/gsed/libexec/gnubin/sed -i "s/$TMUX_LIGHT/$TMUX_DARK/" $HOME/.tmux/.tmux.conf >/dev/null && /opt/homebrew/bin/tmux source $HOME/.tmux.conf >/dev/null
	/opt/homebrew/opt/gsed/libexec/gnubin/sed -i "s/$ALACRITTY_LIGHT/$ALACRITTY_DARK/" $HOME/.config/alacritty/alacritty.toml >/dev/null
	# $HOME/Library/Python/3.9/bin/alacritty-colorscheme apply $ALACRITTY_DARK
fi

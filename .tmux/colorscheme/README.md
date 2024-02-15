In `.tmux.conf` file, there is an additional line to `source-file ~/.tmux/colorscheme/catppuccin_dark.conf`
This line will be `sed` replaced by `switch_theme.sh` script which then called `alacritty-colorscheme` to switch the terminal theme
the `switch_theme.sh` script is called by [dark-mode-notify](https://github.com/bouk/dark-mode-notify) from
an agent located in `~/Library/LaunchAgents/nttai.mater.dark-mode-notify.plist`

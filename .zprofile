eval "$(/opt/homebrew/bin/brew shellenv)"

##
# Your previous /Users/mater/.zprofile file was backed up as /Users/mater/.zprofile.macports-saved_2021-08-26_at_16:25:39
##

# MacPorts Installer addition on 2021-08-26_at_16:25:39: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH:$HOME/Library/Python/3.9/bin"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2021-08-26_at_16:25:39: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

export SHELL_SESSIONS_DISABLE=1
export PATH="/opt/homebrew/Cellar/postgresql/14.4/bin:$PATH"

# export DOTNET_ROOT=$HOME/.dotnet
export DOTNET_ROOT="/usr/local/share/dotnet/"
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools:$HOME/.dotnet/tools

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="$HOME/Library/Python/3.8/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
export KAGGLE_CONFIG_DIR="/Users/mater/.config/kaggle"
export PATH=~/.npm-global/bin:~/node_modules/.bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@23/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export JDTLS_HOME=$HOME/.vim/plugged/nvim-jdtls
export HOMEBREW_NO_AUTO_UPDATE="1"

. "$HOME/.cargo/env"
# If exist .zshenv.secrets, load it
if [ -f "$HOME/.zshenv.secrets" ]; then
    . "$HOME/.zshenv.secrets"
fi

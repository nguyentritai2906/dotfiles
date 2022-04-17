export PATH="$HOME/Library/Python/3.8/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export KAGGLE_CONFIG_DIR="/Users/mater/.config/kaggle"
export PATH=~/.npm-global/bin:~/node_modules/.bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export JDTLS_HOME=$HOME/.vim/plugged/nvim-jdtls

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

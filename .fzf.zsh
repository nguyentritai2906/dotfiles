# Setup fzf
# ---------
if [[ ! "$PATH" == */home/solus/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/solus/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/solus/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"
source "$HOME/.config/fzf/fzf.sh"
source "$HOME/.config/fzf/pip-fzf.sh"

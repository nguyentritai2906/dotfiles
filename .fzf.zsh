# Setup fzf
# ---------
if [[ ! "$PATH" == */home/solus/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/solus/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/solus/.fzf/shell/completion.zsh" 2> /dev/null

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --exclude ".git" . "$1"
}

# Key bindings
# ------------
source "$HOME/.config/fzf/key-bindings.zsh"
source "$HOME/.config/fzf/fzf.sh"
source "$HOME/.config/fzf/pip-fzf.sh"

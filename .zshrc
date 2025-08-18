# ███████╗███████╗██╗  ██╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
# ╚══███╔╝██╔════╝██║  ██║    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
#   ███╔╝ ███████╗███████║    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
#  ███╔╝  ╚════██║██╔══██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
# ███████╗███████║██║  ██║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
# ╚══════╝╚══════╝╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions fasd last-working-dir fzf-brew fzf-conda zsh-syntax-highlighting kubectl)

source $ZSH/oh-my-zsh.sh

# USER CONFIGURATION

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
    export SUDO_EDITOR='nvim'
	export EDITOR='nvim'
fi

# Disable flow control Ctrl+S, since it realy just annoys me
stty -ixon &>/dev/null

SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CONDA_SHOW=true
SPACESHIP_CONDA_ASYNC=true
SPACESHIP_VENV_SHOW=true
SPACESHIP_PYTHON_SHOW=true

# source "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh"
source /opt/homebrew/opt/spaceship/spaceship.zsh
SPACESHIP_PROMPT_ORDER=(
    time          # Time stampts section
    user          # Username section
    dir           # Current directory section
    host          # Hostname section
    git           # Git section (git_branch + git_status)
    venv          # virtualenv section
    conda         # conda virtualenv section
    python        # Python section
    exec_time     # Execution time
    line_sep      # Line break
    exit_code     # Exit code section
    char          # Prompt character
)

# Compilation flags
export ARCHFLAGS="-arch arm64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/zsh/zsh_keybinds.zsh" ] && source "$HOME/.config/zsh/zsh_keybinds.zsh"
[ -f "$HOME/.config/zsh/zsh_functions.zsh" ] && source "$HOME/.config/zsh/zsh_functions.zsh"
[ -f "$HOME/.config/zsh/zsh_aliases.zsh" ] && source "$HOME/.config/zsh/zsh_aliases.zsh"

# Load custom colorscheme
source "$HOME/.config/zsh/colors.zsh"

# Use colors for less, man, etc.
[[ -f ~/.config/less-termcap ]] && . ~/.config/less-termcap

# History in cache directory:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.cache/.zsh_history
setopt append_history # Don't overwrite history file
setopt extended_history # Save timestamp of command
setopt inc_append_history # Add commands as they are typed
setopt hist_ignore_dups # Ignore duplication command history
setopt extended_glob # For 'all files *except*' e.g. `rm ^foo.bar`
setopt share_history # Share history between all sessions

# Configure fzf, command line fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
FD_OPTIONS="--hidden"
export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --tiebreak=length,begin,end,index --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:70%:hidden:wrap' --bind='ctrl-p:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-x:execute(rm -i {+})+abort,alt-k:preview-up,alt-j:preview-down,alt-d:preview-page-down,alt-u:preview-page-up'"
export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd --type f $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

# To get fasd working in a shell, some initialization code must be run
# eval "$(fasd --init auto)"
# Alternatively use Zoxide since fasd is archived
eval "$(zoxide init zsh --cmd j --hook pwd)"

# Using GNU command line tools flavor instead of FreeBSD
# https://gist.github.com/skyzyx/3438280b18e4f7c490db8a2a2ca0b9da
if type brew &>/dev/null; then
  HOMEBREW_PREFIX=$(brew --prefix)
  # GNUBin; GNUMan
  for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do export PATH=$d:$PATH; done
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/mambaforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/mambaforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/opt/homebrew/bin/micromamba';
export MAMBA_ROOT_PREFIX="$HOME/.local/share/mamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

export PYENV_SHELL=zsh
# if Darwin, use homebrew's pyenv
if [[ "$OSTYPE" == "darwin"* ]]; then
  source /opt/homebrew/Cellar/pyenv/*/completions/pyenv.zsh
  export PATH="/opt/homebrew/Cellar/pyenv-virtualenv/1.2.4/shims:${PATH}";
fi
command pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  activate|deactivate|rehash|shell)
    eval "$(pyenv "sh-$command" "$@")"
    ;;
  *)
    command pyenv "$command" "$@"
    ;;
  esac
}
export PYENV_VIRTUALENV_INIT=1;
_pyenv_virtualenv_hook() {
  local ret=$?
  if [ -n "$VIRTUAL_ENV" ]; then
    eval "$(pyenv sh-activate --quiet || pyenv sh-deactivate --quiet || true)" || true
  else
    eval "$(pyenv sh-activate --quiet || true)" || true
  fi
  return $ret
};
typeset -g -a precmd_functions
if [[ -z $precmd_functions[(r)_pyenv_virtualenv_hook] ]]; then
  precmd_functions=(_pyenv_virtualenv_hook $precmd_functions);
fi

# Auto activate env
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Spaceship require `conda` and `CONDA_ENVS_DIRS` to be set
# https://spaceship-prompt.sh/sections/conda/#Options
if [[ -z "$CONDA_ENVS_DIRS" ]]; then
  export CONDA_ENVS_DIRS="$MAMBA_ROOT_PREFIX/envs"
  alias conda='miniconda'
fi

# Defined in $HOME/.config/zsh/zsh_functions.zsh
auto_activate_env

# kubectl completion
[ -f /usr/local/opt/kubectl/share/zsh/_kubectl ] && source /usr/local/opt/kubectl/share/zsh/_kubectl
source <(kubectl completion zsh)

# GitHub Copilot CLI
eval "$(gh copilot alias -- zsh)"

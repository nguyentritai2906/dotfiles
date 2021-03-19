# ███████╗███████╗██╗  ██╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
# ╚══███╔╝██╔════╝██║  ██║    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
#   ███╔╝ ███████╗███████║    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
#  ███╔╝  ╚════██║██╔══██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
# ███████╗███████║██║  ██║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
# ╚══════╝╚══════╝╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝



# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/solus/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"
#ZSH_THEME="robbyrussell"

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
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
plugins=(git zsh-autosuggestions fasd last-working-dir)

source $ZSH/oh-my-zsh.sh

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.config/zsh/git-completion.bash
fpath=(~/.config/zsh $fpath)

autoload -Uz compinit && compinit

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nv'
 fi

# Disable flow control Ctrl+S, since it realy just annoys me
stty -ixon &>/dev/null

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
#SPACESHIP_CHAR_SYMBOL=🞂🞂
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_DOCKER_CONTEXT_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_CONDA_SHOW=true
SPACESHIP_VENV_SHOW=true
SPACESHIP_PYENV_SHOW=true
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_JOBS_SHOW=false

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/zsh/zsh_keybinds" ] && source "$HOME/.config/zsh/zsh_keybinds"
[ -f "$HOME/.config/zsh/zsh_functions" ] && source "$HOME/.config/zsh/zsh_functions"
[ -f "$HOME/.config/zsh/zsh_aliases" ] && source "$HOME/.config/zsh/zsh_aliases"
# Use colors for less, man, etc.
[[ -f ~/.config/less-termcap ]] && . ~/.config/less-termcap

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/.zsh_history
setopt inc_append_history
setopt hist_ignore_dups

# Add Rust to $PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Add Black and Blackd to $PATH
export PATH="$HOME/.local/bin:$PATH"

# Add Java JDK
export JAVA_HOME=/usr/lib64/openjdk-11/

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/solus/google-cloud-sdk/path.zsh.inc' ]; then . '/home/solus/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/solus/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/solus/google-cloud-sdk/completion.zsh.inc'; fi

# Configure fzf, command line fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
FD_OPTIONS="--hidden --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi
--tiebreak=length,begin,end,index --inline-info --preview='[[ \$(file --mime
{}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers
    --color=always {} || cat {}) 2> /dev/null | head -300'
    --preview-window='right:70%:hidden:wrap'
    --bind='ctrl-p:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-x:execute(rm
    -i
    {+})+abort,alt-k:preview-up,alt-j:preview-down,alt-d:preview-page-down,alt-u:preview-page-up'"
# Use git-ls-files inside git repo, otherwise fd
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard || fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd --type f $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

# To get fasd working in a shell, some initialization code must be run
eval "$(fasd --init auto)"

# You should have $GOPATH env variable set and your $PATH should include $GOPATH/bin to run app from anywhere
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Load zsh-syntax-highlighting; should be last.
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export KAGGLE_CONFIG_DIR="/home/solus/.config/kaggle"

# Random wikipedia on this day fact
#
# for day in {1..365}; do
    # mkdir ~/.config/wikidates 2>/dev/null
    # date=$(date -d "now +$day days" +%B_%d)
    # w3m -cols 99999 -dump http://en.wikipedia.org/wiki/$date | sed -n '/^Events/,/^Births/p' | sed '1d;$d' | sed -n 's/^.*•//p' > ~/.config/wikidates/$date
    # echo $date
# done

# w3m -cols 99999 -dump http://en.wikipedia.org/wiki/February_29 | sed -n '/^Events/,/^Births/p' | sed '1d;$d' | sed -n 's/^.*•//p' > ~/.config/wikidates/February_29
#
cat ~/.config/wikidates/$(date +%B_%d) | shuf -n 1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/solus/soft/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/solus/soft/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/solus/soft/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/solus/soft/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=~/.npm-global/bin:~/node_modules/.bin:$PATH

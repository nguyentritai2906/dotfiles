# Function to allow Ctrl-z to toggle between suspend and resume
function Resume {
  zle push-input
  BUFFER="fg"
  zle accept-line
}
zle -N Resume
bindkey "^Z" Resume

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Search and replace with ag
agr() { ag -0 -l "$1" | AGR_FROM="$1" AGR_TO="$2" xargs -r0 perl -pi -e 's/$ENV{AGR_FROM}/$ENV{AGR_TO}/g';  }

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Prompt in middle
# Author: mpy
# https://superuser.com/questions/1389834/can-i-have-the-terminal-prompt-at-the-vertical-middle-of-a-window
zmodload zsh/terminfo # load terminfo modules to make the associative array $terminfo available
PS1o="$PS1" # save current prompt to parameter PS1o
halfpage=$((LINES/2)) # calculate how many lines one half of the terminal's height has
# construct parameter to go down/up $halfpage lines via termcap
halfpage_down=""
for i in {1..$halfpage}; do
  halfpage_down="$halfpage_down$terminfo[cud1]"
done
halfpage_up=""
for i in {1..$halfpage}; do
  halfpage_up="$halfpage_up$terminfo[cuu1]"
done
# This checks if the current command line is empty
# and if so move the prompt up to the middle of the terminal.
# Now you can fast-forward your prompt with an additional press of the ENTER key
magic-enter () {
    if [[ -z $BUFFER ]]
    then
        print ${halfpage_down}${halfpage_up}$terminfo[cuu1]
        zle reset-prompt
    else
        zle accept-line
    fi
}
zle -N magic-enter
bindkey "^M" magic-enter
# To clear the autosuggest part behind cursor
# https://github.com/zsh-users/zsh-autosuggestions/issues/525#issuecomment-623977378
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(magic-enter)

# Archive Extraction
# Usage: Ex <File>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unar $1      ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Auto activate virtual environment when in project folder
# https://stackoverflow.com/a/50830617/12434677
function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]] ; then
    ## If env folder is found then activate the vitualenv
      if [[ -d ./.env ]] ; then
        source ./.env/bin/activate
      fi
  else
    ## check the current folder belong to earlier VIRTUAL_ENV folder
    # if yes then do nothing
    # else deactivate
      parentdir="$(dirname "$VIRTUAL_ENV")"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        deactivate
      fi
  fi
}

# Create an alias for cd and ls:
function cs () {
    cd $1;
    exa -s=name --icons --color=always --group-directories-first
}

function cl () {
    cd $1;
    exa -lamgh -s=name --icons --color-scale --group-directories-first
}

# List then Grep with Exa
lg() {
    exa *$1*(D) -aghl --sort=name --color-scale
}

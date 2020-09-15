#!/bin/bash

## Use fd and fzf to get the args to a command.
##IMPORTANT: Duplicate name with fasd
#f() {
	#sels=( "${(@f)$(fd --hidden "${fd_default[@]}" "${@:2}"| fzf)}"  )
	#test -n "$sels" && print -z -- "$1 ${sels[@]:q:q}"
#}
#
## Like f, but not recursive
#fm() f "$@" --max-depth 1

# Open the selected filewith default editor
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
#fo() {
	#local out file key
	#IFS=$'\n' out=("$(fzf --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
	#key=$(head -1 <<< "$out")
	#file=$(head -2 <<< "$out" | tail -1)
	#if [ -n "$file"  ]; then
		#[ "$key" = ctrl-o  ] && open "$file" || ${EDITOR:-vim} "$file"
	#fi
#}
#
# Or just open it
fo() {
    local file=$(fzf --query="$1" --exit-0)
    if [ -n "$file"  ]; then
        open "$file" &
    fi
}
bindkey -s '^o' 'fo\n'

# cd to selected parent dir
fpd(){
	local declare dirs=()
	get_parent_dirs() {
		if [[ -d "${1}"  ]]; then
			dirs+=("$1");
		else
			return;
		fi
		if [[ "${1}" == '/'  ]]; then
			for _dir in "${dirs[@]}"; do echo $_dir; done
		else
				get_parent_dirs $(dirname "$1")
		fi
	}
    local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf --tac)
	cd "$DIR"
}

# cdf - cd into the directory of the selected file
cdf() {
    local file
    local dir
    file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# fkill - kill process
# Similar to "kill -9 **" fzf default completion
fkill() {
	local pid
	pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
	if [ "x$pid" != "x"  ]; then
		echo $pid | xargs kill -${1:-9}
	fi
}

# Search with fzf and open in vim
fzf-vim() (
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
)
bindkey -s '^t' "fzf-vim\n"

#fzf-vim() {
    #setopt localoptions pipefail no_aliases 2> /dev/null
    #local file="$(eval "$FZF_CTRL_T_COMMAND" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(__fzfcmd) -m "$@")"
    #[[ -z "$file" ]] && zle redisplay && return 0
    ## Use the default editor if it's defined, otherwise Vim
    #${EDITOR:-vim} "$file" </dev/tty # </dev/tty tell vim input from terminal
    ##${EDITOR:-vim} "$file"
    #unset file # ensure this doesn't end up appearing in prompt expansion
    #local ret=$?
    #zle fzf-redraw-prompt
    #zle zle-line-init # Vi cursor shape does not init for some reason
    #return $ret
#}
#zle -N fzf-vim
#bindkey '^t' fzf-vim

# Search with fzf and open in vim from anywhere to anyfile
fzf-home-vim() (
  IFS=$'\n' files=($(cd $HOME && fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "$HOME/${files[@]}"
)
bindkey -s '\et' "fzf-home-vim\n"

#Search for installed packages
pli() {
    local inst=$(eopkg li | fzf --ansi --preview="echo {} | cut -d' ' -f1 | xargs -I{} eopkg info {} | bat")
    print -z -- "$(echo $inst | awk '{print $1;}')"
}

#Search for packages in the repositories and install
pit() {
    local inst=$(cat $HOME/.config/repo-la.txt | fzf -m --ansi --preview="echo {} | cut -d' ' -f1 | xargs -I{} eopkg info {} | bat")
    test -n "$inst" && print -z -- "sudo eopkg it $(echo $inst | cut -d' ' -f1 | tr '\n' ' ')"
}

#Search for installed packages and remove
prm() {
    local inst=$(eopkg li | fzf -m --ansi --preview="echo {} | cut -d' ' -f1 | xargs -I{} eopkg info {} | bat")
    test -n "$inst" && print -z -- "sudo eopkg rm $(echo $inst | cut -d' ' -f1 | tr '\n' ' ')"
}

pca() {
    echo "Caching available packages in Solus repository";
    eopkg la | sed -e '1,3d' > $HOME/.config/repo-la.txt;
    echo "Done!";
}

#Cache all available packages in the repositories for faster 'pit' search
if [ -f "$HOME/.config/repo-la.txt" ]; then
    if [ $(expr $(date +%s) - $(date +%s -r $HOME/.config/repo-la.txt)) -gt 1296000 ]; then
    echo "[Cache available packages] Would you like to update? [Y/n]: \c"
    read line
        if [[ "$line" == Y* ]] || [[ "$line" == y* ]] || [ -z "$line" ]; then
            pca;
        else
            echo "As you wish!";
        fi
    fi
else
    pca;
fi

# Fuzzy grep via Ag then open it in the default editor if it's defined,
# otherwise Vim (with line number)
sag() {
  local file
  local line
  read -r file line <<<"$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1, $2}')"
  if [[ -n $file ]]
  then
     vim $file +$line
  fi
}

# Similar to ALT+C default keybinding
# But from anywhere to anywhere
fzf-home-cd-widget() {
  local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(cd $HOME && eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  cd "$HOME/$dir"
  unset dir # ensure this doesn't end up appearing in prompt expansion
  local ret=$?
  zle fzf-redraw-prompt
  return $ret
}
zle     -N    fzf-home-cd-widget
bindkey '\ed' fzf-home-cd-widget

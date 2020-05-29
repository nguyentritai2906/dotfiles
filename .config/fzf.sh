#!/bin/bash

# Use fd and fzf to get the args to a command.
f() {
	sels=( "${(@f)$(fd --hidden "${fd_default[@]}" "${@:2}"| fzf)}"  )
	test -n "$sels" && print -z -- "$1 ${sels[@]:q:q}"
}

# Like f, but not recursive
fm() f "$@" --max-depth 1

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

# Or just open it
fo() {
    local file=$(fzf --query="$1" --exit-0)
    if [ -n "$file"  ]; then
        open "$file" &
    fi
}
bindkey -s '^o' 'fo\n'

# fcd - cd to selected directory
# Similar to default ALT+C fzf key binding
fcd() {
	local dir
	dir=$(find ${1:-.} -path '*/\.*' -prune \
		-o -type d -print 2> /dev/null | fzf +m) && cd "$dir"
}

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

# Search a file with fzf inside a Tmux pane and then open it in an editor
fzf-vim() {
	local file=$(fzf)
	# Open the file if it exists
	if [ -n "$file" ]; then
		# Use the default editor if it's defined, otherwise Vim
		${EDITOR:-vim} "$file"
	fi
}
# Search with fzf and open in vim
bindkey -s '^t' "fzf-vim\n"

#Search for installed packages
pli() {
    local inst=$(eopkg li | sed -e '1,3d' | fzf --ansi --preview="echo {} | cut -d' ' -f1 | xargs -I{} eopkg info {} | bat")
    print -z -- "$(echo $inst | awk '{print $1;}')"
}
#Search for packages in the repositories and install
pit() {
    local inst=$(cat $HOME/.config/repo-la.txt | sed -e '1,3d' | fzf -m --ansi --preview="echo {} | cut -d' ' -f1 | xargs -I{} eopkg info {} | bat")
    test -n "$inst" && print -z -- "sudo eopkg it $(echo $inst | cut -d' ' -f1 | tr '\n' ' ')"
}
#Search for installed packages and remove
prm() {
    local inst=$(eopkg li | sed -e '1,3d' | fzf -m --ansi --preview="echo {} | cut -d' ' -f1 | xargs -I{} eopkg info {} | bat")
    test -n "$inst" && print -z -- "sudo eopkg rm $(echo $inst | cut -d' ' -f1 | tr '\n' ' ')"
}
#Cache all available packages in the repositories for faster 'pit' search
if [ -f "$HOME/.config/repo-la.txt" ]; then
    if [ $(expr $(date +%s) - $(date +%s -r $HOME/.config/repo-la.txt)) -gt 1296000 ]; then
    echo "[Cache available packages] Would you like to update? [Y/n]: \c"
    read line
        if [[ "$line" == Y* ]] || [[ "$line" == y* ]] || [ -z "$line" ]; then
            echo "Caching available packages in Solus repository";
            eopkg la | sed -e '1,3d' > $HOME/.config/repo-la.txt;
            echo "Done!";
        else
            echo "As you wish!";
        fi
    fi
fi

#Use The-Silver-Searcher to search for code then open it in EDITOR or vim
sag() {
    local file=$(ag "$1" | fzf | cut -d':' -f1)
    # Open the file if it exists
    if [ -n "$file"  ]; then
        # Use the default editor if it's defined, otherwise Vim
        ${EDITOR:-vim} "$file"
    fi
}

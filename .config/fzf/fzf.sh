#!/bin/bash

# Open the selected filewith default editor
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
	local out file key
	IFS=$'\n' out=("$(fzf --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
	key=$(head -1 <<< "$out")
	file=$(head -2 <<< "$out" | tail -1)
	if [ -n "$file"  ]; then
		[ "$key" = ctrl-o  ] && open "$file" || ${EDITOR:-vim} "$file"
	fi
}

# fkill - kill process
# Similar to "kill -9 **" fzf default completion
fkill() {
	local pid
	pid=$(ps -ef | sed 1d | fzf -m  -q "$1"| awk '{print $2}')
	if [ "x$pid" != "x"  ]; then
		echo $pid | xargs kill -${1:-9}
	fi
}

# Search with fzf and open in vim
fv() (
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
)

# Search with fzf and open in vim from anywhere to anyfile
fhv() (
  IFS=$'\n' files=($(cd $HOME && fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "$HOME/${files[@]}"
)

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

# Cd from anywhere to anywhere
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
  zle reset-prompt
  return $ret
}
zle -N fzf-home-cd-widget

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fco - checkout git branch/tag
fco() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi) || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

bindkey -s '^o' 'fo\n'
bindkey -s '^t' 'fv\n'
bindkey -s '†' "fhv\n" # Alt/Opt+T
bindkey '∂' fzf-home-cd-widget # Alt/Opt+D

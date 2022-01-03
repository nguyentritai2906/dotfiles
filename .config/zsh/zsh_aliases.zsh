# Command aliases
alias vim='nvim'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias buds="bluetoothctl connect F4:7D:EF:EF:0B:79"
alias sony="bluetoothctl connect 70:26:05:9D:51:81"
alias speaker="bluetoothctl connect 98:52:3D:1C:51:73"
alias icf="vim ~/.config/i3/config"
alias pcf="vim ~/.config/polybar/config.ini"
alias tcf="vim ~/.tmux/.tmux.conf"
alias tcflc="vim ~/.tmux.conf.local"
alias vcf="vim ~/.vimrc"
alias zcf="vim ~/.zshrc"
alias acf="vim ~/.config/alacritty/alacritty.yml"
alias rcf="vim ~/.config/ranger/rc.conf"
alias sv='sudo -E /usr/local/bin/nv'
alias l='cd - >/dev/null'
alias curl='curl --silent --show-error'
alias hg='history | grep'
alias ls='exa -s=name --icons --color=always --group-directories-first'
alias la='ls -a'
alias ll='exa -lamgh -s=name --icons --color-scale --group-directories-first'
alias tree='exa -lamghT --icons --color-scale --group-directories-first'
alias cf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cfv='GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME vim'
alias cfi='GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME vim ~/.config/nvim/init.vim'
alias cfs="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status"
alias cfd="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME diff"
alias cfb="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME branch"
alias cfa="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add"
alias cfc="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit"
alias cfca="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -a"
alias cfp="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push"
alias cfl="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull"
alias cfm="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME mv"
alias cflog="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME log --graph --oneline --decorate --all"
alias ra='ranger --choosedir=$HOME/.config/ranger/rangerdir; LASTDIR=`cat $HOME/.config/ranger/rangerdir`; cd "$LASTDIR"'
alias p='python3'

# Starts one or multiple args as programs in background
# Open GUI application with just filename without command prefix
function background() {
  for ((i=2;i<=$#;i++)); do
    ${@[1]} ${@[$i]} &> /dev/null &
  done
}

alias -s html='background google-chrome-stable'
alias -s {pdf,PDF}='background open'
alias -s {mp4,MP4,mov,MOV}='background vlc'
alias -s {zip,ZIP}="unzip -l"
alias -s {epub,EPUB}="epr"
alias -s {jpg,png}='background open'

function _pip(){
    if [[ $1 = "search" ]]; then
        pip_search "$2";
    else pip "$@";
    fi;
}
alias pip=_pip


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PS1="\[\e[1;33m\]\u@\h \w\\$ \[\e[m\]"

source $HOME/dotfiles/.bashrc.history

alias r=rails

source $HOME/dotfiles/.bashrc.golang
source $HOME/dotfiles/.bashrc.rvm
source $HOME/dotfiles/.bashrc.nvm
source $HOME/dotfiles/.bashrc.android
source $HOME/dotfiles/.bashrc.yarn

source ~/bash-wakatime/bash-wakatime.sh

export EDITOR=vim

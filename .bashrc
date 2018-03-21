
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source $HOME/dotfiles/.bashrc.history

alias r=rails

source $HOME/dotfiles/.bashrc.golang
source $HOME/dotfiles/.bashrc.rvm
source $HOME/dotfiles/.bashrc.nvm
source $HOME/dotfiles/.bashrc.android

export EDITOR=vim

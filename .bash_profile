
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh

source ~/dotfiles/ssh_complete
source ~/dotfiles/.bash_profile.python
source ~/dotfiles/.bash_profile.google_cloud

export PATH

export PATH=$PATH:~/bin

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

source ~/dotfiles/ssh_complete
source ~/dotfiles/.bash_profile.python
source ~/dotfiles/.bash_profile.google_cloud
source ~/dotfiles/.bash_profile.nvm
source ~/dotfiles/.bash_profile.rvm
# source ~/dotfiles/.bash_profile.azure

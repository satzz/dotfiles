# http://webtech-walker.com/archive/2010/04/22173415.html
mkdir -p ~/bin 
cd ~/bin

curl -LO http://xrl.us/perlbrew --insecure
chmod +x perlbrew
./perlbrew install
echo "source $HOME/perl5/perlbrew/etc/bashrc" >> ~/.zshrc

curl -LO http://xrl.us/cpanm --insecure
chmod +x cpanm
cpanm local::lib

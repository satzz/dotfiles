# http://webtech-walker.com/archive/2010/04/22173415.html
curl -LO http://xrl.us/perlbrew
chmod +x perlbrew
./perlbrew install
echo "source $HOME/perl5/perlbrew/etc/bashrc" >> ~/.zshrc

mkdir bin && cd ~/bin
curl -LO http://xrl.us/cpanm
chmod +x cpanm
cpanm local::lib

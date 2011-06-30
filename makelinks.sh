cd ~; ls -dl ~/config/.* | grep ^\-.* | rev | cut -d' ' -f1 | rev | xargs -I{} ln -s {}

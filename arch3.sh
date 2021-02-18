wget git.io/yay-install.sh

sh yay-install.sh --noconfirm

yay -Syy
yay -S polybar --noconfirm

git clone https://github.com/tiroged734/conf.git

rm -r $HOME/.config/*

find ~/conf/dotfiles/* -type d -exec ln -s {} ~/.config/ \;
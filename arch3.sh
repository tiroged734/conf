wget git.io/yay-install.sh

sh yay-install.sh --noconfirm

yay -Syy
yay -S polybar --noconfirm

git clone https://github.com/tiroged734/conf.git

rm -r $HOME/.config/*

for file in ./conf/dotfiles/*
do
tempfile="$HOME/.config/${BASH_REMATCH[1]}"
ln -s "$file" "$tempfile"
ln -s "$tempfile" "${tempfile%.*}"
done
su -u nobody wget git.io/yay-install.sh

su -u nobody sh yay-install.sh --noconfirm)

su -u nobody yay -Syy)
su -u nobody yay -S polybar --noconfirm)

su -u nobody git clone https://github.com/tiroged734/conf.git)

su -u nobody rm -r $HOME/.config/*)
(su -u nobody
for file in ./conf/dotfiles/*
do
tempfile="/home/$username/.config/${BASH_REMATCH[1]}"
ln -s "$file" "$tempfile"
ln -s "$tempfile" "${tempfile%.*}"
done
)
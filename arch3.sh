#!/bin/bash
#read -p "Введите имя пользователя: " username
username="user"

echo 'Добавляем пользователя'
useradd -m -g users -G wheel -s /bin/bash $username

echo 'Создаем root пароль'
passwd

echo 'Устанавливаем пароль пользователя'
passwd $username

echo 'Прописываем имя компьютера'
echo mypc > /etc/hostname
ln -svf /usr/share/zoneinfo/Asia/Yekaterinburg /etc/localtime

echo '3.4 Добавляем русскую локаль системы'
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen 

echo 'Обновим текущую локаль системы'
locale-gen

echo 'Указываем язык системы'
echo 'LANG="ru_RU.UTF-8"' > /etc/locale.conf

echo 'Вписываем KEYMAP=ru FONT=cyr-sun16'
echo 'KEYMAP=ru' >> /etc/vconsole.conf
echo 'FONT=cyr-sun16' >> /etc/vconsole.conf

echo 'Создадим загрузочный RAM диск'
mkinitcpio -p linux

echo '3.5 Устанавливаем загрузчик'
pacman -Syy
pacman -S grub --noconfirm 
grub-install /dev/sda

echo 'Обновляем grub.cfg'
grub-mkconfig -o /boot/grub/grub.cfg

echo 'Ставим программу для Wi-fi'
pacman -S dialog wpa_supplicant --noconfirm 


echo 'Устанавливаем SUDO'
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

echo 'Раскомментируем репозиторий multilib Для работы 32-битных приложений в 64-битной системе.'
echo '[multilib]' >> /etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
pacman -Syy

echo 'Ставим иксы и драйвера'
pacman -S xorg-server xorg-drivers xorg-xinit virtualbox-guest-utils

echo "Ставим i3"
pacman -S i3-gaps terminator lxdm wget neofetch git --noconfirm

systemctl enable lxdm

echo 'Подключаем автозагрузку менеджера входа и интернет'
systemctl enable NetworkManager

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

echo 'Установка завершена! Перезагрузите систему.'
echo 'Если хотите подключить AUR, установить мои конфиги XFCE, тогда после перезагрзки и входа в систему, установите wget (sudo pacman -S wget) и выполните команду:'
echo 'wget https://git.io/JtMtC && sh arch3.sh'
exit
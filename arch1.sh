loadkeys ru
setfont cyr-sun16

timedatectl set-ntp true

(
  echo o;

  echo n;
  echo;
  echo;
  echo;
  echo +100M;

  echo n;
  echo;
  echo;
  echo;
  echo +5G;

  echo n;
  echo;
  echo;
  echo;
  echo;

  echo a;
  echo 1;

  echo w;
) | fdisk /dev/sda

mkfs.vfat  /dev/sda1 -L boot
mkfs.ext4  /dev/sda2 -L root
mkfs.ext4  /dev/sda3 -L home

mount /dev/sda2 /mnt
mkdir /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
mount /dev/sda3 /mnt/home

echo "Server = http://mirror.yandex.ru/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist

pacstrap /mnt base base-devel linux linux-firmware vim dhcpcd netctl

genfstab -pU /mnt >> /mnt/etc/fstab

arch-chroot /mnt sh -c "$(curl -fL https://git.io/JtMtC)"
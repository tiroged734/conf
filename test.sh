(
	echo n;
echo ;
echo ;
echo ;
echo +512M;
echo n;
echo ;
echo ;
echo ;
echo +5G;
echo n;
echo ;
echo ;
echo ;
echo ;
echo w;
) | fdisk /dev/sda;
echo mkfs.vfat /dev/sda1;
echo mkfs.ext4 /dev/sda2;
echo mkfs.ext4 /dev/sda3;
echo mount /dev/sda2 /mnt;
echo mkdir /mnt/boot;
echo mkdir /mnt/home;
echo mount /dev/sda1 /mnt/boot;
echo mount /dev/sda3 /mnt/home;
echo pacstrap /mnt base base-devel;
echo genfstab -U /mnt >> /mnt/etc/fstab;
echo arch-chroot /mnt;
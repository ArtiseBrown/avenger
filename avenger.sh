#!/bin/bash

echo loadkeys uk

echo parted /dev/sda

echo mklabel msdos

echo mkpart primary ext4 1MiB 100%

echo set 1 boot on

echo quit

echo mkfs.ext4 /dev/sda1

echo mount /dev/sda1 /mnt

# nano /etc/pacman.d/mirrorlist

echo pacstrap -i /mnt base base-devel grub fish sudo xorg-server xorg-server-utils gnome gnome-extra lightdm lightdm-gtk-greeter

echo genfstab -U /mnt > /mnt/etc/fstab

echo arch-chroot /mnt /bin/bash

echo en_UK.UTF-8 > /etc/locale.gen

echo locale-gen

echo LANG=en_UK.UTF-8 > /etc/locale.conf

echo export LANG=en_UK.UTF-8

echo ln -s /usr/share/zoneinfo/Eurpoe/London > /etc/localtime

echo hwclock --systohc --utc

echo grub-install --recheck --target=i386-pc /dev/sda

echo grub-mkconfig -o /boot/grub/grub.cfg

echo avenger > /etc/hostname

echo passwd

echo useradd -m -G wheel,users -s /bin/fish artise

echo passwd

echo systemctl start lightdm.service

echo systemctl enable lightdm.service

echo exit

echo umount -R /mnt

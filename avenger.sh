#!/bin/bash

loadkeys uk

parted /dev/sda

mklabel msdos

mkpart primary ext4 1MiB 100%

set 1 boot on

quit

mkfs.ext4 /dev/sda1

mount /dev/sda1 /mnt

# nano /etc/pacman.d/mirrorlist

pacstrap -i /mnt base base-devel grub fish sudo xorg-server xorg-server-utils gnome gnome-extra lightdm lightdm-gtk-greeter

genfstab -U /mnt > /mnt/etc/fstab

arch-chroot /mnt /bin/bash

echo en_UK.UTF-8 > /etc/locale.gen

locale-gen

echo LANG=en_UK.UTF-8 > /etc/locale.conf

export LANG=en_UK.UTF-8

ln -s /usr/share/zoneinfo/Eurpoe/London > /etc/localtime

hwclock --systohc --utc

grub-install --recheck --target=i386-pc /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg

echo avenger > /etc/hostname

passwd

useradd -m -G wheel,users -s /bin/fish artise

passwd

echo systemctl start lightdm.service

echo systemctl enable lightdm.service

echo exit

echo umount -R /mnt

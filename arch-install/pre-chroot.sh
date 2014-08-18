#!/bin/sh

# Setup swap
swapon /dev/sda3

#Mount partitions
mount -o compress=lzo,rw,noatime,autodefrag,inode_cache /dev/sda1 /mnt
mkdir -p /mnt/home
mount -o compress=lzo,rw,noatime,autodefrag,inode_cache /dev/sda2 /mnt/home
mkdir -p /mnt/mnt/data
mount /dev/storage/data /mnt/mnt/data
mkdir -p /mnt/mnt/emulation
mount /dev/storage/emulation /mnt/mnt/emulation
mkdir -p /mnt/mnt/backup
mount /dev/storage/backup /mnt/mnt/backup

# Configure pacman
cp /backup/arch-install/mirrorlist /etc/pacman.d/mirrorlist
cp /backup/arch-install/pacman.conf /etc/pacman.conf
pacman-key -r 5EE46C4C
pacman-key --lsign-key 5EE46C4C
pacman -Sy

#Install base system
pacstrap /mnt $(pacman -Sqg base | sed 's/^linux$/&-ck-nehalem/') grub sudo htop vim btrfs-progs

# Generate fstab
genfstab -L -p /mnt >> /mnt/etc/fstab
clear
cat /mnt/etc/fstab

echo
echo "Remove fsck hook from /etc/mkinitcpio.conf"
echo "Run arch-chroot /mnt /bin/bash"
echo "Run /mnt/backup/arch-install/post-chroot.sh"


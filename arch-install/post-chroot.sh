#!/bin/sh

# Set locale
cp /mnt/backup/arch-install/locale.gen /etc/locale.gen
locale-gen
echo LANG=en_GB.UTF-8 > /etc/locale.conf
export LANG=en_GB.UTF-8

# Configure TTY
loadkeys uk
setfont Lat2-Terminus16
cp /mnt/backup/arch-install/vconsole.conf /etc/vconsole.conf

# Set time
ln -s /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc --utc

# Set hostname
echo arch > /etc/hostname

# Configure network
mkdir /etc/conf.d
cp /mnt/backup/arch-install/network@enp2s0 /etc/conf.d/network@enp2s0
cp /mnt/backup/arch-install/network@.service /etc/systemd/system/network@.service
systemctl enable network@enp2s0.service
echo "nameserver 192.168.1.254" > /etc/resolv.conf
chattr +i /etc/resolv.conf

# Create initial ramdisk
mkinitcpio -p linux-ck

# Install grub
grub-install --target=i386-pc --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

#Configure users
echo "Set root password"
passwd root
useradd -m -g users -G wheel -s /bin/bash rob
chfn -f "Rob Pinder" rob
echo "Set robs password"
passwd rob

#Configure shell
cp /mnt/backup/rob/.bashrc /home/rob/.bashrc
cp /mnt/backup/rob/.bash_aliases /home/rob/.bash_aliases
cp /mnt/backup/rob/.vimrc /home/rob/.vimrc
chown rob:users /home/rob/.bashrc
chown rob:users /home/rob/.bash_aliases
chown rob:users /home/rob/.vimrc
cp /etc/skel/.bash_profile /root/.bash_profile
ln -s /home/rob/.bashrc /root/.bashrc
ln -s /home/rob/.bash_aliases /root/.bash_aliases
ln -s /home/rob/.vimrc /root/.vimrc

cp /mnt/backup/arch-install/pacman.conf /etc/pacman.conf
cp /mnt/backup/arch-install/mirrorlist /etc/pacman.d/mirrorlist
pacman-key -r 5EE46C4C
pacman-key --lsign-key 5EE46C4C

echo "Run visudo before exit"

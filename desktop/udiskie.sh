#!/usr/bin/env bash

clear

sudo pacman -S --noconfirm --needed udiskie \
	libappindicator-gtk2 \
	libappindicator-gtk3

sudo mkdir -p /etc/tmpfiles.d/
echo -e "D /media 0755 root root 0 -" | sudo tee /etc/tmpfiles.d/media.conf

sudo mkdir -p /etc/udev/rules.d/
echo -e 'ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{UDISKS_FILESYSTEM_SHARED}="1"' | sudo tee /etc/udev/rules.d/99-udisks2.rules

sudo mkdir -p /etc/udisks2
sudo tee /etc/udisks2/mount_options.conf <<-EOF
	[defaults]
	exfat_defaults=uid=\$UID,gid=\$GID,iocharset=utf8,errors=remount-ro,sync
	ntfs:ntfs3_defaults=uid=\$UID,gid=\$GID
EOF

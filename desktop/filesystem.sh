#!/usr/bin/env bash

clear

sudo pacman -S --needed --noconfirm util-linux exfatprogs ntfs-3g
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer
sudo usermod -aG disk $USER

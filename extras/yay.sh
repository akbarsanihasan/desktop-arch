#!/usr/bin/env bash

clear

sudo pacman -S --noconfirm git base-devel

sudo rm -rf /tmp/yay
git clone https://aur.archlinux.org/yay-bin.git /tmp/yay

makepkg -sri --noconfirm -D /tmp/yay

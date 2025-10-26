#!/usr/bin/env bash

clear

sudo pacman -S --noconfirm --needed iptables nftables firewalld
sudo systemctl enable firewalld

#!/usr/bin/env bash

clear

if ! command -v yay &>/dev/null; then
	clear
	echo yay is not installed, install it first
	exit 1
fi

yay -S --noconfirm zen-browser-bin

xdg-settings set default-web-browser zen.desktop

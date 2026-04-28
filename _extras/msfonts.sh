#!/usr/bin/env bash

clear

if ! command -v yay &>/dev/null; then
	clear
	echo yay is not installed, install first
	exit 1
fi

yay -S --cleanafter --noconfirm ttf-ms-win11-auto

#!/usr/bin/env bash

clear

current_dir=$PWD

DOWNLOAD_PATH=/tmp/nerdfonts

sudo pacman -S --noconfirm --needed git

if ! [[ -d $DOWNLOAD_PATH ]]; then
	mkdir -p "$DOWNLOAD_PATH"
	git clone --filter=blob:none --sparse \
		https://github.com/ryanoasis/nerd-fonts.git \
		"$DOWNLOAD_PATH"
fi

cd "$DOWNLOAD_PATH"

git sparse-checkout add patched-fonts/JetBrainsMono
git sparse-checkout add patched-fonts/FiraCode

./install.sh -U
./install.sh -Up

cd "$current_dir"

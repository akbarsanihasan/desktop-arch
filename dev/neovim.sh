#!/usr/bin/env bash

clear

sudo pacman -S --noconfirm --needed neovim \
	lua51 \
	luarocks \
	tree-sitter-cli \
	curl \
	wget \
	unzip \
	tar \
	gzip

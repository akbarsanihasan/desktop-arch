#!/usr/bin/env bash

clear

core=(
	tmux
	fzf
	btop
	trash-cli
)
apps=(
	foot
	firefox
	chromium
	thunderbird
	mpv
	flameshot
	blanket
)
dependencies=(
	vlc-plugins-all
	gvfs-mtp
	thunar-archive-plugin
	thunar-volman
	thunar-media-tags-plugin
	tumbler
	ffmpegthumbnailer
	webp-pixbuf-loader
	dconf
)
utilities=(
	coreutils
	fd
	jq
	ripgrep
	gawk
	less
	curl
	wget
	tar
	zip
	unzip
	unrar
	p7zip
	man
	tldr
)

sudo pacman -S --noconfirm --needed "${core[@]}" "${apps[@]}" "${dependencies[@]}" "${utilities[@]}"
xdg-settings set default-web-browser firefox.desktop
dconf load /com/rafaelmardojai/Blanket/ <./.dotfiles/blanket.dconf

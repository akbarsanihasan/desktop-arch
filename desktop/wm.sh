#!/usr/bin/env bash

clear

core=(
	zsh
	wayland
	xorg-xwayland
	xorg-xhost
	sway
	swayidle
	swaybg
	swaylock
	xdg-desktop-portal
	xdg-desktop-portal-wlr
	xdg-desktop-portal-gtk
)
panels=(
	waybar
	dunst
	rofi
	pavucontrol
	blueman
	network-manager-applet
)
apps=(
	thunar
	file-roller
	okular
	ristretto
	mousepad
	gparted
)
dependencies=(
	dconf
	xdg-user-dirs
	wl-clipboard
	grim
	gvfs
	gammastep
	polkit-gnome
	libnotify
	brightnessctl
	playerctl
	rofi-calc
	rofi-emoji
	cliphist
)

sudo pacman -S --noconfirm --needed "${core[@]}" \
	"${panels[@]}" \
	"${apps[@]}" \
	"${dependencies[@]}"

sudo chsh -s "$(command -v zsh)" "$USER"
sudo usermod $USER -aG input

mkdir -p $HOME/.config/qalculate

dconf write /org/gnome/desktop/wm/preferences/button-layout "':'"

/usr/bin/xdg-user-dirs-update
mkdir -p "$HOME"/.config/gtk-3.0
tee "$HOME"/.config/gtk-3.0/bookmarks <<-EOF
	file:///home/$USER/Documents
	file:///home/$USER/Downloads
	file:///home/$USER/Music
	file:///home/$USER/Pictures
	file:///home/$USER/Public
	file:///home/$USER/Templates
	file:///home/$USER/Videos
EOF

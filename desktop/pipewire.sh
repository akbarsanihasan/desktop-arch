#!/usr/bin/env bash

clear

packages=(
    pipewire
    pipewire-audio
    pipewire-pulse
    pipewire-alsa
    pipewire-jack
    wireplumber
    rtkit
)

if pacman -Q jack2 &>/dev/null; then
    sudo pacman -Rddns --noconfirm jack2
fi
sudo pacman -S --needed --noconfirm "${packages[@]}"

systemctl --user start pipewire
systemctl --user enable wireplumber

wpctl status &>/dev/null
sleep 3
wpctl set-volume @DEFAULT_SINK@ 40%
wpctl set-volume @DEFAULT_SOURCE@ 40%
wpctl set-mute @DEFAULT_SOURCE@ 1

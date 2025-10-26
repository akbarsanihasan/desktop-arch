#!/usr/bin/env bash

clear

packages=(
    fcitx5
    fcitx5-gtk
    fcitx5-mozc
    fcitx5-hangul
    fcitx5-configtool
    noto-fonts-cjk
)
sudo pacman -S --noconfirm --needed "${packages[@]}"

if ! [[ -d /tmp/fcitx-theme ]]; then
    git clone --depth 1 https://github.com/catppuccin/fcitx5.git /tmp/fcitx-theme
fi
if ! [[ -d $HOME/.local/share/fcitx5/themes ]]; then
    mkdir -p "$HOME"/.local/share/fcitx5/themes
fi
cp -r /tmp/fcitx-theme/src/catppuccin-mocha-mauve "$HOME"/.local/share/fcitx5/themes

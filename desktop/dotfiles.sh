#!/usr/bin/env bash

clear

mkdir -p "$HOME"/.config
mkdir -p "$HOME"/.local/bin
mkdir -p "$HOME"/.local/share

sudo pacman -S --noconfirm --needed git fd

fd . "$PWD"/.dotfiles/.config --max-depth 1 --exec rm -rf "$HOME"/.config/{/}
fd . "$PWD"/.dotfiles/.config --max-depth 1 --exec ln -svfn {} "$HOME"/.config/{/}

fd . "$PWD"/.dotfiles/.local/bin --max-depth 1 --exec rm -rf "$HOME"/.local/bin/{/}
fd . "$PWD"/.dotfiles/.local/bin --max-depth 1 --exec ln -svfn {} "$HOME"/.local/bin/{/}

rm -rf "$HOME"/.dotfiles/wallpaper.png
ln -svfn "$PWD"/.dotfiles/wallpaper.png "$HOME"/wallpaper.png

rm -rf "$HOME"/.dotfiles/.zprofile
ln -svfn "$PWD"/.dotfiles/.zprofile "$HOME"/.zprofile

rm -rf "$HOME"/.dotfiles/.zshrc
ln -svfn "$PWD"/.dotfiles/.zshrc "$HOME"/.zshrc

OMZ=$HOME/.local/share/oh-my-zsh
ZSH_PLUGINS=(zsh-users/zsh-autosuggestions zsh-users/zsh-completions zsh-users/zsh-syntax-highlighting)
if ! [[ -d "$OMZ" ]]; then
    git clone https://github.com/ohmyzsh/ohmyzsh "$HOME"/.local/share/oh-my-zsh
fi
for zsh_plugin in "${ZSH_PLUGINS[@]}"; do
    name=$(basename "$zsh_plugin")
    if ! [[ -d "$OMZ/custom/plugins/$name" ]]; then
        git clone https://github.com/"$zsh_plugin" "$OMZ/custom/plugins/$name"
    fi
done

if ! [[ -d $HOME/.config/tmux/theme ]]; then
    git clone https://github.com/catppuccin/tmux "$HOME"/.config/tmux/theme
fi

if ! [[ -e $HOME/.config/btop/themes/catppuccin.theme ]]; then
    mkdir -p "$HOME"/.config/btop/themes
    git clone https://github.com/catppuccin/btop /tmp/btop-theme
    cp /tmp/btop-theme/themes/catppuccin_mocha.theme "$HOME"/.config/btop/themes/catppuccin.theme
fi

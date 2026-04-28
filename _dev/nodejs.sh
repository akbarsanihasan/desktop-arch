#!/usr/bin/env bash

clear

export NPM_CONFIG_CACHE=$HOME/.node
export NPM_CONFIG_PREFIX=$HOME/.node

sudo pacman -S --noconfirm --needed curl unzip

FNM_PATH=$HOME/.local/bin
if ! command -v "$FNM_PATH"/fnm &>/dev/null; then
	curl -fsSL https://fnm.vercel.app/install |
		sudo bash -s -- --skip-shell --install-dir "$FNM_PATH"
fi

eval "$("$FNM_PATH"/fnm env --fnm-dir "$HOME"/.node)"
"$FNM_PATH"/fnm install --lts

shellrcs=(.zshrc .bashrc)
for shellrc in "${shellrcs[@]}"; do
	if ! [[ -e "$HOME/$shellrc" ]]; then
		touch "$HOME/$shellrc"
	fi
	if ! grep -i "# NodeJS" "$HOME/$shellrc" &>/dev/null; then
		tee -a "$HOME/$shellrc" <<-EOF
			# NodeJS
			export NPM_CONFIG_CACHE=\$HOME/.node
			export NPM_CONFIG_PREFIX=\$HOME/.node
			if command -v fnm &>/dev/null || command -v $FNM_PATH/fnm &>/dev/null; then
			   eval "\$(fnm env --fnm-dir "\$HOME"/.node)"
			fi
		EOF
	fi
done

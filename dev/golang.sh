#!/usr/bin/env bash

clear

sudo pacman -S --noconfirm --needed wget tar

VERSION=1.25.3
INSTALL_PATH=/opt/go
DOWNLOAD_PATH=/tmp/go"$VERSION".linux-amd64.tar.gz
URL=https://go.dev/dl/"$(basename "$DOWNLOAD_PATH")"
if ! tar -tvf "$DOWNLOAD_PATH" &>/dev/null; then
	curl -Lo "$DOWNLOAD_PATH" "$URL"
fi

sudo rm -rf "$INSTALL_PATH"
sudo tar -C "$(dirname "$INSTALL_PATH")" -xzf "$DOWNLOAD_PATH"
sudo chown -R "$USER" "$INSTALL_PATH"

shellrcs=(.zshrc .bashrc)
for shellrc in "${shellrcs[@]}"; do
	if ! [[ -e "$HOME/$shellrc" ]]; then
		touch "$HOME/$shellrc"
	fi
	if ! grep -i "# Golang" "$HOME/$shellrc" &>/dev/null; then
		tee -a "$HOME/$shellrc" <<-EOF
			# Golang
			export PATH="$INSTALL_PATH/bin:\$PATH"
			export PATH="\$HOME/go/bin:\$PATH"
		EOF
	fi
done

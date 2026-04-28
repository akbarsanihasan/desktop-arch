#!/usr/bin/env bash

clear

sudo pacman -S --noconfirm --needed curl

BASE_URL="https://download.herdphp.com"
DOWNLOAD_PATH=/tmp/php
INSTALL_PATH="/opt/php"
INSTALL_BIN_PATH=$INSTALL_PATH/bin

mkdir -p "$DOWNLOAD_PATH"/bin
sudo rm -rf "$INSTALL_PATH"

if ! [[ -e "$DOWNLOAD_PATH"/bin/php ]]; then
	curl -L "$BASE_URL/herd-lite/linux/x64/8.4/php" -o "$DOWNLOAD_PATH"/bin/php
fi
if ! [[ -e "$DOWNLOAD_PATH"/bin/composer ]]; then
	curl -L "$BASE_URL/herd-lite/composer" -o "$DOWNLOAD_PATH"/bin/composer
fi
if ! [[ -e "$DOWNLOAD_PATH"/bin/laravel ]]; then
	curl -L "$BASE_URL/herd-lite/laravel" -o "$DOWNLOAD_PATH"/bin/laravel
fi
curl -L "https://curl.se/ca/cacert.pem" -o "$DOWNLOAD_PATH"/cacert.pem
sudo cp -R "$DOWNLOAD_PATH" "$INSTALL_PATH"
sudo chmod -R +x "$INSTALL_PATH"/bin
sudo chown -R "$USER" /opt/php

sudo tee "$INSTALL_PATH"/php.ini <<-EOF
	curl.cainfo=$INSTALL_PATH/cacert.pem
	openssl.cafile=$INSTALL_PATH/cacert.pem
	pcre.jit=0
EOF

shellrcs=(.zshrc .bashrc)
for shellrc in "${shellrcs[@]}"; do
	if ! [[ -e "$HOME/$shellrc" ]]; then
		touch "$HOME/$shellrc"
	fi
	if ! grep -i "# PHP" "$HOME/$shellrc" &>/dev/null; then
		tee -a "$HOME/$shellrc" <<-EOF
			# PHP
			export PATH="$INSTALL_PATH/bin:\$PATH"
			export PHP_INI_SCAN_DIR="$INSTALL_PATH:\$PHP_INI_SCAN_DIR"
		EOF
	fi
done

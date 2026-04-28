#!/usr/bin/env bash

clear

if ! getent group docker; then
	sudo groupadd docker
fi
sudo usermod -aG docker "$USER"

sudo pacman -S --noconfirm --needed \
	docker \
	docker-compose \
	docker-buildx

sudo systemctl enable docker

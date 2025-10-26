#!/usr/bin/env bash

clear

sudo pacman -S --noconfirm podman crun
systemctl --user enable podman --now

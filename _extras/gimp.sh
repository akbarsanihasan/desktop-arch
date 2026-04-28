#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed gimp curl unzip

curl -Lo /tmp/photogimp.zip https://github.com/Diolinux/PhotoGIMP/releases/download/3.0/PhotoGIMP-linux.zip
unzip -o /tmp/photogimp.zip -d /tmp
cp -R /tmp/PhotoGIMP-linux/.config/GIMP "$HOME"/.config

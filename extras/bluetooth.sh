#!/usr/bin/env bash

clear

sudo pacman -S --noconfirm --needed bluez bluez-obex bluez-utils

if grep -qEi "^#.*Experimental.*=.*" /etc/bluetooth/main.conf; then
    sudo sed -i 's/^#\s*Experimental.*=.*/Experimental = true/' /etc/bluetooth/main.conf
fi

if grep -qEi "^#.*KernelExperimental.*=.*" /etc/bluetooth/main.conf; then
    sudo sed -i 's/^#\s*KernelExperimental.*=.*/Experimental = true/' /etc/bluetooth/main.conf
fi

sudo systemctl enable bluetooth

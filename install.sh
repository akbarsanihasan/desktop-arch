#!/usr/bin/env bash

clear

set -euo pipefail

[[ -f /etc/os-release ]] && . /etc/os-release

if [[ $ID != "arch" ]]; then
	echo "OS not detected as archlinux"
	exit 1
fi

sudo -v
timestamp_sudo() {
	while :; do
		sudo -v
		sleep 45
	done
}
timestamp_sudo &
timestamp_sudo_pid=$!
trap "sudo -k; kill -9 $timestamp_sudo_pid 2>/dev/null;" EXIT SIGINT SIGTERM

source ./desktop/pipewire.sh
source ./desktop/filesystem.sh
source ./desktop/firewall.sh
source ./desktop/dotfiles.sh
source ./desktop/wm.sh
source ./desktop/common.sh
source ./desktop/ime.sh
source ./desktop/udiskie.sh
source ./desktop/nerdfonts.sh
source ./desktop/theme.sh
source ./desktop/sddm.sh

source ./dev/nodejs.sh
source ./dev/golang.sh
source ./dev/php.sh
source ./dev/clang.sh
source ./dev/rust.sh
source ./dev/neovim.sh
source ./dev/git.sh
source ./dev/docker.sh

clear
echo "Done"

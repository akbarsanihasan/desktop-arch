#!/usr/bin/env bash

clear

sudo pacman -Sy --noconfirm \
	qemu-full \
	libvirt \
	virt-manager \
	virt-viewer \
	dnsmasq \
	bridge-utils \
	dmidecode \
	swtpm \
	openbsd-netcat \
	iptables \
	nftables \
	libguestfs \
	virtiofsd

echo "options kvm_intel nested=1" | sudo tee /etc/modprobe.d/kvm.conf
echo "options kvm_intel emulate_invalid_guest_state=0" | sudo tee -a /etc/modprobe.d/kvm.conf
echo "options kvm ignore_msrs=1 report_ignored_msrs=0" | sudo tee -a /etc/modprobe.d/kvm.conf

sudo sed -i -e 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/' \
	-e 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf

sudo usermod -aG libvirt "$USER"
sudo usermod -aG libvirt-qemu "$USER"
sudo usermod -aG kvm "$USER"
sudo usermod -aG input "$USER"
sudo usermod -aG disk "$USER"

dconf write /org/virt-manager/virt-manager/xmleditor-enabled true
dconf write /org/virt-manager/virt-manager/console/resize-guest 1
dconf write /org/virt-manager/virt-manager/console/scaling 1
dconf write /org/virt-manager/virt-manager/console/auto-redirect false
dconf write /org/virt-manager/virt-manager/system-tray true
dconf write /org/virt-manager/virt-manager/new-vm/firmware "'uefi'"

sudo systemctl start libvirtd
sudo systemctl enable libvirtd

if sudo virsh net-info default >/dev/null 2>&1; then
	echo -e
	echo "Network 'default' is already defined."

	if ! sudo virsh net-info default | grep -E "Active:\s+yes"; then
		echo "Network 'default' is not started. Starting it now..."
		sudo virsh net-start default
	fi

	if ! sudo virsh net-info default | grep -qE "Autostart:\s+yes"; then
		echo "Network 'default' is not set to autostart. Configuring it now..."
		sudo virsh net-autostart default
	fi
else
	echo "Network 'default' is not defined. Defining it now..."
	tee /tmp/default.xml <<-EOF
		<network>
		<name>default</name>
		<uuid>a102a3ff-0ee1-4947-98a4-953bd9229b95</uuid>
		<forward mode='nat'/>
		<bridge name='virbr0' stp='on' delay='0'/>
		<mac address='52:54:00:99:07:91'/>
		<ip address='192.168.122.1' netmask='255.255.255.0'>
		<dhcp>
		  <range start='192.168.122.2' end='192.168.122.254'/>
		</dhcp>
		</ip>
		</network>
	EOF

	sudo virsh net-define --file /tmp/default.xml
	sudo virsh net-start default
	sudo virsh net-autostart default
	echo -e "Network 'default' has been defined, started, and set to autostart.\n"
fi

echo -e
echo "Installed, might need reboot"

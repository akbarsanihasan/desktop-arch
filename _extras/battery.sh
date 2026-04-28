#!/usr/bin/env bash

clear

sudo pacman -S --noconfirm --needed tlp

sudo mkdir -p /etc/tlp.d

sudo tee /etc/tlp.d/10-threshold.conf <<-EOF
	START_CHARGE_THRESH_BAT0=75
	STOP_CHARGE_THRESH_BAT0=80
	START_CHARGE_THRESH_BAT1=75
	STOP_CHARGE_THRESH_BAT1=80
	RESTORE_THRESHOLDS_ON_BAT=1
EOF

sudo tee /etc/tlp.d/20-profile.conf <<-EOF
	PLATFORM_PROFILE_ON_AC=performance
	PLATFORM_PROFILE_ON_BAT=balanced

	CPU_ENERGY_PERF_POLICY_ON_AC=performance
	CPU_ENERGY_PERF_POLICY_ON_BAT=balance_performance

	CPU_BOOST_ON_AC=1
	CPU_BOOST_ON_BAT=0
EOF

sudo systemctl enable tlp

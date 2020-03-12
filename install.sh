#!/bin/bash

cd /opt

apt purge --yes python* vim* cryptsetup-initramfs xorriso* extlinux* grub* yad reiser* elinks* memtest* mc* rox*

apt update
apt upgrade --yes

wget http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-keyring.deb
dpkg -i trinity-keyring.deb
apt install -f --yes
rm ./trinity-keyring.deb

echo deb http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-r14.0.x buster main > /etc/apt/sources.list
echo deb http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-builddeps-r14.0.x buster main >> /etc/apt/sources.list

apt update
apt upgrade --yes

apt install --yes --no-install-recommends firmware-linux-free firmware-linux-nonfree \
   firmware-atheros firmware-iwlwifi firmware-zd1211 firmware-realtek firmware-bnx2 firmware-brcm80211 firmware-b43-* b43-fwcutter\
   firmware-cavium firmware-ipw2x00 firmware-libertas firmware-ti-connectivity \
   xserver-xorg xserver-xorg-video-* xserver-xorg-input-all xserver-xorg-legacy \
   wmctrl xdotool libdrm-intel1 libgl1-mesa-dri libglu1-mesa \
   xinit x11-utils x11-xserver-utils libxcursor1 \
   breeze-cursor-theme

rm -Rf /usr/share/icons/breeze_cursors
mv /usr/share/icons/Breeze_Snow /usr/share/icons/breeze_cursors

apt install tdebase-trinity seamonkey --yes

apt purge --yes foomatic* klipper* khelpcenter* ktip* kate* *-dbg libgtk1* libgtk-3*

rm -r /usr/lib/python3
rm -r /usr/share/doc/*
rm -r /usr/share/man/*
rm -r /usr/share/man-db/*
rm -r /usr/src/*

apt autoremove --purge
apt autoclean
apt clean

live-remaster

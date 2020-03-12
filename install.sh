#!/bin/bash

cd /opt

apt purge --yes python* vim*

apt update
apt upgrade --yes

wget http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-keyring.deb
dpkg -i trinity-keyring.deb
apt install -f --yes
rm ./trinity-keyring.deb

echo deb http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-r14.0.x buster main > /etc/apt/sources.list
echo deb http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-builddeps-r14.0.x buster main >> /etc/apt/sources.list

apt update

apt install --yes --no-install-recommends firmware-linux-free firmware-linux-nonfree \
   firmware-atheros firmware-iwlwifi firmware-zd1211 firmware-realtek firmware-bnx2 firmware-brcm80211 firmware-b43-* b43-fwcutter\
   firmware-cavium firmware-ipw2x00 firmware-libertas firmware-ti-connectivity \
   xserver-xorg xserver-xorg-video-* xserver-xorg-input-all xserver-xorg-legacy \
   wmctrl xdotool libdrm-intel1 libgl1-mesa-dri libglu1-mesa \
   xinit x11-utils x11-xserver-utils libxcursor1 \
   breeze-cursor-theme

rm -Rf /usr/share/icons/breeze_cursors
mv /usr/share/icons/Breeze_Snow /usr/share/icons/breeze_cursors

apt install tdebase-trinity --yes

apt purge --yes foomatic* klipper*

apt autoremove --purge
apt autoclean
apt clean



live-remaster


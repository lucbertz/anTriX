#!/bin/bash

cd /opt

locale-gen
localedef --list-archive | grep -v -i ^en | xargs localedef --delete-from-archive

apt purge --yes python* vim* cryptsetup-initramfs xorriso* extlinux* grub* \
  yad reiser* elinks* memtest* mc* rox* console* debconf-i18n locales* gdbm-l10n libc-l10n 

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

apt install --yes tdebase-trinity tdm-trinity baobab seamonkey libgtk-3-0 libdbus-glib-1-2

apt purge --yes foomatic* klipper* khelpcenter* ktip* kate* *-dbg libgtk1*

rm -r /usr/lib/python3
rm -r /usr/share/doc/*
rm -r /usr/share/man/*
rm -r /usr/share/man-db/*
rm -r /usr/src/*

rm -r /opt/trinity/share/wallpapers/*
rm -r /opt/trinity/share/sounds/*
rm -r /opt/trinity/share/doc/*
rm -r /usr/share/wallpaper/
rm -r /usr/share/icons/Adwaita/512*
rm -r /usr/share/icons/Adwaita/256*
rm -r /usr/share/icons/Adwaita/scalable*
rm -r /usr/share/icons/Adwaita/cursors/*

apt autoremove --purge
apt autoclean
apt clean

live-remaster

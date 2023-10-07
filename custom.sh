#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
mytmp=/ztmpz

# Install NetHunter
cd $mytmp
apt install -y python-is-python3 python3-psutil macchanger mdk4 aircrack-ng gir1.2-notify-0.7 git kbd cryptsetup osk-sdl cryptsetup-initramfs
git clone https://github.com/shubhamvis98/nethunter-pinephone nhpp
cd nhpp; ./install.sh

# Install ttyescape
cd $mytmp
wget https://github.com/Shubhamvis98/PinePhone_Tweaks/raw/main/ttyescape.tar.gz -O ttyesc.tgz && \
  tar -C / -xpf ttyesc.tgz && \
  systemctl enable hkdm

sed -i 's/-0.07/0/;s/-0.13/0/' /usr/share/plymouth/themes/kali/kali.script || true

# Install kalitorify
cd $mytmp
git clone https://github.com/brainfucksec/kalitorify ktor
cd ktor
DATA_DIR=/usr/share
BACKUP_DIR=/var/lib
PROGRAM_DIR=/usr/bin
PROGRAM_NAME=kalitorify
install -Dm755 kalitorify.sh $PROGRAM_DIR/$PROGRAM_NAME
mkdir -p $DATA_DIR/$PROGRAM_NAME/data
mkdir -p $BACKUP_DIR/$PROGRAM_NAME/backups
install -Dm644 data/* $DATA_DIR/$PROGRAM_NAME/data


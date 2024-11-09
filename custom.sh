#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
mytmp=/ztmpz

# Install NetHunter
apt install nethunter network-scanner hijacker -y

# Install ttyescape
cd $mytmp
wget https://github.com/Shubhamvis98/PinePhone_Tweaks/raw/main/ttyescape.tar.gz -O ttyesc.tgz && \
  tar -C / -xpf ttyesc.tgz && \
  systemctl enable hkdm

sed -i 's/-0.07/0/;s/-0.13/0/' /usr/share/plymouth/themes/kali/kali.script || true

# Install kalitorify
cd $mytmp
apt install -y tor iptables
git clone https://github.com/shubhamvis98/kalitorify ktor
cd ktor
DATA_DIR=/usr/share
BACKUP_DIR=/var/lib
PROGRAM_DIR=/usr/bin
PROGRAM_NAME=kalitorify
install -Dm755 kalitorify.sh $PROGRAM_DIR/$PROGRAM_NAME
mkdir -p $DATA_DIR/$PROGRAM_NAME/data
mkdir -p $BACKUP_DIR/$PROGRAM_NAME/backups
install -Dm644 data/* $DATA_DIR/$PROGRAM_NAME/data

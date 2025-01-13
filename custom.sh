#!/bin/bash

# Nothing Phone (1)
curl 'https://salsa.debian.org/DebianOnMobile-team/qcom-phone-utils/-/raw/debian/latest/initramfs-tools/hooks/qcom-firmware?ref_type=heads' > /usr/share/initramfs-tools/hooks/qcom-firmware

export DEBIAN_FRONTEND=noninteractive
mytmp=/ztmpz

# Install NetHunter
apt install kbd nethunter network-scanner hijacker -y

# Install ttyescape
cd $mytmp
wget https://github.com/Shubhamvis98/PinePhone_Tweaks/raw/main/ttyescape.tar.gz -O ttyesc.tgz && \
  tar -C / -xpf ttyesc.tgz && \
  systemctl enable hkdm

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


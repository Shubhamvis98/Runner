#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
mytmp=/ztmpz
cd $mytmp
apt install -y python-is-python3 python3-psutil macchanger mdk4 aircrack-ng gir1.2-notify-0.7 git
git clone https://github.com/shubhamvis98/nethunter-pinephone nhpp
cd nhpp; ./install.sh

wget https://github.com/Shubhamvis98/Only4Me/raw/master/ttyescape.tar.gz -O ttyesc.tgz && \
tar -C / -xpf ttyesc.tgz && \
systemctl enable hkdm

sed -i 's/-0.07/0/;s/-0.13/0/' /usr/share/plymouth/themes/kali/kali.script || true


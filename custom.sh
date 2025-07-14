#!/bin/bash

# Nothing Phone (1)
curl 'https://salsa.debian.org/DebianOnMobile-team/qcom-phone-utils/-/raw/debian/latest/initramfs-tools/hooks/qcom-firmware?ref_type=heads' > /usr/share/initramfs-tools/hooks/qcom-firmware
curl 'https://gitlab.com/mobian1/droid-juicer/-/raw/master/configs/nothing,spacewar.toml?ref_type=heads' | grep -v 'ipa_fws' > /usr/share/droid-juicer/configs/nothing,spacewar.toml

export DEBIAN_FRONTEND=noninteractive
mytmp=/ztmpz

# Install NetHunter
apt install kbd nethunter network-scanner hijacker -y

# Install ttyescape
cd $mytmp
wget https://github.com/Shubhamvis98/PinePhone_Tweaks/raw/main/ttyescape.tar.gz -O ttyesc.tgz && \
  tar -C / -xpf ttyesc.tgz && \
  systemctl enable hkdm

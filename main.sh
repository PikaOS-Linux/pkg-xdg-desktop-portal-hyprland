#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Add dependent repositories
wget -q -O - https://ppa.pika-os.com/key.gpg | sudo apt-key add -
add-apt-repository https://ppa.pika-os.com
add-apt-repository ppa:pikaos/pika
add-apt-repository ppa:kubuntu-ppa/backports

# Clone Upstream
wget -nv https://github.com/hyprwm/xdg-desktop-portal-hyprland/archive/refs/tags/v0.4.0.tar.gz
tar -xf ./v0.4.0.tar.gz
mkdir -p ./xdg-desktop-portal-hyprland-0.4.0
cp -rvf ./debian ./xdg-desktop-portal-hyprland-0.4.0/
cd ./xdg-desktop-portal-hyprland-0.4.0/

# Get build deps
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/

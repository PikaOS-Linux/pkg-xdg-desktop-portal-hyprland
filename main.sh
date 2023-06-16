#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone --recurse-submodules https://github.com/hyprwm/xdg-desktop-portal-hyprland.git
cd xdg-desktop-portal-hyprland
git checkout v0.4.0
cp -rvf ../debian ./

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/

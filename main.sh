#! /bin/bash

DEBIAN_FRONTEND=noninteractive

apt-get update

# Clone Upstream
git clone --recurse-submodules https://github.com/hyprwm/xdg-desktop-portal-hyprland.git -b v1.2.2
cd xdg-desktop-portal-hyprland
cp -rvf ../debian ./

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/

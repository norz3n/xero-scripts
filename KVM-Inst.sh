#!/usr/bin/env bash
set -e
########################################################################################################################
# Author	:	TechXero Thanks to Ermanno Ferrari @EFLinux for How-To
# Website	:	https://www.techxero.com / https://www.eflinux.net
########################################################################################################################

echo "##################################################################################################################"
echo "#                                           KVM Installer Script                                                 #"
echo "##################################################################################################################"
sleep 3
echo "Downloading KVM and Dpendencies..."
sudo pacman -S --needed qemu qemu-arch-extra virt-manager ovmf edk2-ovmf vde2 dnsmasq bridge-utils openbsd-netcat
sudo wget "https://raw.githubusercontent.com/TechXero/ArcoLinux/main/Configs/kvmnet.xml" -O ~/kvmnet.xml
echo "Starting LibVirt-d Service..."
sudo systemctl enable libvirtd.service && sudo systemctl start libvirtd.service
sleep 5
echo "Adding user to Libvirt Group..."
usermod -aG libvirt username
sleep 5
echo "Setting up Networking services..."
sudo virsh net-define kvmnet.xml
sudo virsh net-start XeroNet
sudo virsh net-autostart XeroNet
echo "All Done Happy VM'ing. Brough to you by @TechXero & @ermanno_ferrari"
sleep 5

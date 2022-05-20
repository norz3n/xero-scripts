#!/bin/bash
set -e
##################################################################################################################
# Author	:	DarkXero
# Website	:	https://xerolinux.github.io
##################################################################################################################

# Based on tutorial by @EFlinux https://www.youtube.com/watch?v=itZf5FpDcV0

echo "Downloading KVM and Dpendencies..."
sudo pacman -S --noconfirm --needed qemu virt-manager virt-viewer libvirt iptables-nft dnsmasq dmidecode edk2-ovmf
echo
echo "Starting LibVirt-d Service..."
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
echo
echo "Enabling Nested Virtualzation..."
echo -e "options kvm-intel nested=1" | sudo tee -a /etc/modprobe.d/kvm-intel.conf
echo
echo "Adding user to Libvirt/KVM Groups..."
##Change your username here
read -p "What is your login?
It will be used to add this user to the 2 different groups : " choice
sudo gpasswd -a $choice libvirt
sudo gpasswd -a $choice kvm
echo
echo "Appending required settings..."
echo '
nvram = [
    "/usr/share/ovmf/x64/OVMF_CODE.fd:/usr/share/ovmf/x64/OVMF_VARS.fd"
]' | sudo tee --append /etc/libvirt/qemu.conf
echo
echo "Setting up Networking services..."
sudo virsh net-start default
sudo virsh net-autostart
echo
echo "############################################################################################################"
echo "#####################              REBOOT FOR CHANGES TO TAKE EFFECT                   #####################"
echo "############################################################################################################"


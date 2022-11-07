#!/bin/bash
#set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	DarkXero
# Website 	: 	http://xerolinux.xyz
##################################################################################################################
echo
tput setaf 3
echo "###############################################################################"
echo "#               XeroLinux nVidia (Proprietary) Driver Installer               #"
echo "#                                                                             #"
echo "#                            !!!! ATTENTION !!!                               #"
echo "#                                                                             #"
echo "#                This Will Install Drivers For Any nVidia GPUs                #"
echo "#                                                                             #"
echo "#                  Carefully Select The Appropriate Drivers.                  #"
echo "###############################################################################"
tput sgr0
echo
echo "Select which nVidia Drivers to Install."
echo
echo "############# nVidia Proprietary Drivers #############"
echo
echo "1.  Check Which nVidia GPU You Have."
echo "2.  nVidia R520.x Drivers (GTX 900 Series Onwards)."
echo "3.  nVidia R470.x Drivers (GTX 500 Series Up To 700)."
echo "4.  nVidia R390.x Drivers (GTX 400 Series & Older Not all)."
echo
echo "Type Your Selection. To Exit, just close Window."
echo

while :; do

read CHOICE

case $CHOICE in

    1 )
      echo
      echo "##########################################"
      echo "           Checking nVidia GPU            "
      echo "##########################################"
			sleep 3
			if pacman -Qi nvidia-utils &> /dev/null; then
               nvidia-smi -L
              else
      echo
      echo "Sorry No nVidia GPU is present"
            fi
			sleep 3
      echo
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"
            exit
      ;;

    2 )
      echo
      echo "##########################################"
      echo "   Installing nVidia R520.x GPU Drivers   "
      echo "##########################################"
			sleep 3
			sudo pacman -S --noconfirm --needed nvidia-dkms-tkg nvidia-utils-tkg nvidia-settings-tkg opencl-nvidia-tkg libxnvctrl lib32-nvidia-utils-tkg lib32-opencl-nvidia-tkg
			sleep 3
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"
            exit
      ;;

    3 )
      echo
      echo "##########################################"
      echo "   Installing nVidia R470.x GPU Drivers   "
      echo "##########################################"
			sleep 3
			sudo pacman -S --noconfirm nvidia-470xx-dkms-tkg nvidia-470xx-utils-tkg nvidia-470xx-settings-tkg opencl-nvidia-470xx-tkg libxnvctrl-470xx lib32-nvidia-470xx-utils-tkg lib32-opencl-nvidia-470xx-tkg lib32-libxnvctrl-470xx
			sleep 3
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"
            exit
      ;;

    3 )
      echo
      echo "##########################################"
      echo "   Installing nVidia R390.x GPU Drivers   "
      echo "##########################################"
			sleep 3
			sudo pacman -S --noconfirm nvidia-390xx-dkms nvidia-390xx-utils nvidia-390xx-settings libxnvctrl-390xx opencl-nvidia-390xx lib32-nvidia-390xx-utils lib32-opencl-nvidia-390xx
			sleep 3
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"
            exit
      ;;

    * )
      echo "#################################"
      echo "    Choose the correct number    "
      echo "#################################"
      ;;
esac
done
#!/bin/bash

clear

GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
NC="\e[0m"

function pause(){
  echo ""
  read -p "Press Enter to continue..."
}

while true
do
clear
echo -e "${GREEN}"
echo "======================================="
echo "        Ubuntu Server Manager"
echo "======================================="
echo "1) Update & Upgrade"
echo "2) IP Local Config (GRE/IPIP)"
echo "3) Gost Install"
echo "4) VortexL2 Install"
echo "5) VortexL2 Uninstall"
echo "6) Rathole Install"
echo "7) 3x-ui (Sanai Panel)"
echo "8) Enable BBR"
echo "9) Fix Github Download"
echo "10) Fix DNS (Github Problem)"
echo "11) Change SSH Port"
echo "12) Fix Update Speed (Iran Mirror)"
echo "0) Exit"
echo "======================================="
echo -e "${NC}"

read -p "Select Option: " option

case $option in

1)
echo "Updating system..."
apt-get update -y && apt-get upgrade -y
pause
;;

2)
echo "Installing GRE/IPIP..."
apt install python3 -y
apt install python3-pip -y
pip install colorama netifaces
apt install curl -y
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Azumi67/6TO4-GRE-IPIP-SIT/main/ubuntu24.sh)"
pause
;;

3)
echo "Installing Gost..."
bash <(curl -Ls https://github.com/masoudgb/Gost-ip6/raw/main/Gost.sh)
pause
;;

4)
echo "Installing VortexL2..."
bash <(curl -Ls https://raw.githubusercontent.com/iliya-Developer/VortexL2/main/install.sh)
pause
;;

5)
echo "Uninstalling VortexL2..."
bash <(curl -Ls https://raw.githubusercontent.com/iliya-Developer/VortexL2/main/uninstall.sh)
pause
;;

6)
echo "Installing Rathole..."
bash <(curl -Ls --ipv4 https://raw.githubusercontent.com/Musixal/rathole-tunnel/main/rathole_v2.sh)
pause
;;

7)
echo "Installing 3x-ui Sanai Panel..."
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
pause
;;

8)
echo "Enabling BBR..."
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
sysctl net.ipv4.tcp_congestion_control
pause
;;

9)
echo "Fix Github Raw..."
echo "185.199.108.133 raw.githubusercontent.com" >> /etc/hosts
pause
;;

10)
echo "Fix DNS..."
echo -e "nameserver 1.1.1.1\nnameserver 8.8.8.8" > /etc/resolv.conf
pause
;;

11)
nano /etc/ssh/sshd_config
systemctl restart sshd
pause
;;

12)
echo "Changing mirror..."
sed -i 's/http:\/\/[a-z]*.archive.ubuntu.com/http:\/\/mirror.manageit.ir/g' /etc/apt/sources.list
apt update
pause
;;

0)
exit
;;

*)
echo -e "${RED}Invalid Option${NC}"
sleep 2
;;

esac
done

#!/bin/bash

while true; do
    clear
    echo "========================================"
    echo "       Dorsa Server Toolkit"
    echo "========================================"
    echo "1. Update & Upgrade"
    echo "2. IP Local Config (GRE)"
    echo "3. Gost Install"
    echo "4. Paqet Tunnel"
    echo "5. Show Paqet Core Link"
    echo "6. Rathole Install"
    echo "7. X-UI SanaiPanel Install"
    echo "8. Enable BBR"
    echo "9. GitHub Problem Fix"
    echo "10. SSH Config"
    echo "11. Restart SSH"
    echo "12. Abuse Defender"
    echo "0. Exit"
    echo "========================================"
    read -p "Select an option: " option

    case $option in
        1)
            apt-get update -y && apt-get upgrade -y
            ;;
        2)
            bash -c "\$(curl -fsSL https://raw.githubusercontent.com/Azumi67/6TO4-GRE-IPIP-SIT/main/ubuntu24.sh)"
            ;;
        3)
            bash <(curl -Ls https://github.com/masoudgb/Gost-ip6/raw/v2.1.7/Gost.sh)
            ;;
        4)
            bash <(curl -fsSL https://raw.githubusercontent.com/behzadea12/Paqet-Tunnel-Manager/main/paqet-manager.sh)
            ;;
        5)
            echo "Paqet Core Link:"
            echo "https://github.com/behzadea12/Paqet-Tunnel-Manager/releases/download/PaqetOptimized/paqet-linux-amd64-v2.2.0-optimize.tar.gz"
            ;;
        6)
            bash <(curl -Ls --ipv4 https://raw.githubusercontent.com/Musixal/rathole-tunnel/main/rathole_v2.sh)
            ;;
        7)
            bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh) v2.8.4
            ;;
        8)
            echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
            echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
            sysctl -p
            ;;
        9)
            echo "185.199.108.133 raw.githubusercontent.com" >> /etc/hosts
            ;;
        10)
            nano /etc/ssh/sshd_config
            ;;
        11)
            systemctl restart sshd
            ;;
        12)
            bash <(curl -s https://raw.githubusercontent.com/Kiya6955/Abuse-Defender/main/abuse-defender.sh)
            ;;
        0)
            exit 0
            ;;
        *)
            echo "Invalid option!"
            ;;
    esac

    echo
    read -p "Press Enter to continue..."
done

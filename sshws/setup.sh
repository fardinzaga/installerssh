#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
  echo "You need to run this script as root"
  exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
  echo "OpenVZ is not supported"
  exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
if [ -f "/etc/v2ray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/premium-script;
mkdir /etc/v2ray;
echo "IP=" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /etc/v2ray/domain
wget https://raw.githubusercontent.com/fardinzaga/installerssh/master/cf/cf.sh && chmod +x cf.sh && ./cf.sh
#install ssh ovpn
wget https://raw.githubusercontent.com/fardinzaga/installerssh/master/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn.sh ./ssh-vpn.sh
#install ssh ws
wget https://raw.githubusercontent.com/fardinzaga/installerssh/master/websket/install-ws.sh && chmod +x install-ws.sh && screen -S install-ws.sh ./install-ws.sh

rm -f /root/ssh-vpn.sh
rm -f /root/install-ws.sh
history -c
echo "1.1" > /home/ver
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "=================================-Script Mod Fauzanvpn-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                  : 22, 500"  | tee -a log-install.txt
echo "   - SSH-WS CDN               : 2095"  | tee -a log-install.txt
echo "   - SSH-WS CDN OpenSSH       : 2086"  | tee -a log-install.txt
echo "   - SSH-WS CDN Dropbear      : 2082"  | tee -a log-install.txt
echo "   - SSH-WS CDN SSL/TLS       : 443"  | tee -a log-install.txt
echo "   - OpenVPN                  : TCP 1194, UDP 2200, SSL 992, X1197"  | tee -a log-install.txt
echo "   - Stunnel4 SSL/TLS         : 444, 777"  | tee -a log-install.txt
echo "   - Dropbear                 : 143, 109"  | tee -a log-install.txt
echo "   - Squid Proxy              : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                   : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                    : 81"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 08.00 GMT +7" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "------------------------------------------Mod by Fauzanvpn------------------------------------------" | tee -a log-install.txt
echo ""
echo " Reboot 10 Sec"
sleep 10
reboot
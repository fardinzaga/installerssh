#!/bin/bashf
read -rp "Domain/Host: " -e host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "domain=$host" >> /etc/v2ray/domain

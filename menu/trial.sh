#!/bin/bash

IP=$(wget -qO- icanhazip.com);
domain=$(cat /etc/v2ray/domain);

Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1


echo Script AutoCreate Akun SSH dan OpenVPN Mod By Fauzanvpn
sleep 1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Informasi Trial 1 Hari SSH & OpenVPN"
echo -e "Username          : $Login "
echo -e "Password          : $Pass"
echo -e "==============================="
echo -e "Host              : $domain"
echo -e "OpenSSH           : 22, 500"
echo -e "Dropbear          : 143, 109"
echo -e "WS-OPENSSH        : 2095"
echo -e "WS-DROPBEAR       : 2052"
echo -e "WS-OVPN           : 2082"
echo -e "WS-SSH            : 2086"
echo -e "WS-SSH SSL/TLS    : 443, 2096"
echo -e "SSL/TLS           : 444, 777"
echo -e "BADVPN/UDPGW      : 7100, 7200, 7300"
echo -e "SQUID             : 3128, 8080 (limit to IP SSH)" 
echo -e "ZIP FILE          : http://$domain:81/ALL.zip"
echo -e "==============================="
echo -e "Aktif Sampai      : $exp"
echo -e "================================="
echo -e "Payload SSH Websocket HTTP"                                                          
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "================================="
echo -e "Payload SSH Websocket SSL"
echo -e "GET wss://bug [protocol][crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "================================="
echo -e "Script Mod By Fauzanvpn"

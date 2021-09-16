#!/bin/bash
clear
echo Installing Websocket-SSH Python
sleep 1
echo Cek Hak Akses...
sleep 0.5
cd

#Install system auto run
#System OpenSSH Websocket-SSH Python
cd
cd /etc/systemd/system/
wget -O /etc/systemd/system/ws-openssh.service https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-openssh.service
#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-dropbear.service
#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-stunnel.service
#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-fauzanvpn.service
#System OpenSSH Websocket-SSH Python
wget -O /etc/systemd/system/ws-openssh.service https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-maulana.service
##System Websocket-OpenVPN Python
#wget -O /etc/systemd/system/ws-ovpn.service https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-ovpn.service

#Install Script Websocket-SSH Python
cd
cd /usr/local/bin/
wget -O /usr/local/bin/ws-openssh https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-openssh && chmod +x /home/admin/ws-openssh
wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-dropbear && chmod +x /home/admin/bin/ws-dropbear
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-stunnel && chmod +x /home/admin/ws-stunnel
wget -O /usr/local/bin/ws-fauzanvpn https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-fauzanvpn && chmod +x /home/admin/ws-fauzanvpn
wget -0 /usr/local/bin/ws-maulana https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-maulana && chmod +x /home/admin/ws-maulana
wget -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws.ovpn && chmod +x /home/admin/ws-ovpn

#izin permision
chmod +x /usr/local/bin/ws-openssh
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel
chmod +x /usr/local/bin/ws-fauzanvpn
chmod +x /usr/local/bin/ws-maulana
#chmod +x /usr/local/bin/ws-ovpn

#restart service
#
systemctl daemon-reload
#Enable & Start & Restart ws-openssh service
systemctl enable ws-openssh.service
systemctl start ws-openssh.service
systemctl restart ws-openssh.service

#Enable & Start & Restart ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable & Start & Restart ws-stunnel service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service

#Enable & Start & Restart ws-fauzanvpn service
systemctl enable ws-fauzanvpn.service
systemctl start ws-fauzanvpn.service
systemctl restart ws-fauzanvpn.service

#Enable & Start & Restart ws-maulana service
systemctl enable ws-maulana.service
systemctl start ws-maulana.service
systemctl restart ws-maulana.service

#Enable & Start ws-ovpn service
#systemctl enable ws-ovpn.service
#systemctl start ws-ovpn.service
#systemctl restart ws-ovpn.service

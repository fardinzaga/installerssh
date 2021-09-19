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
#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-fauzanvpn.service https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-fauzanvpn.service
#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-diana.service https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-diana.service
#System Websocket-OpenSSH Python
wget -O /etc/systemd/system/ws-hazrian.service https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-hazrian.service
#System Websocket-OpenVPN Python
#wget -O /etc/systemd/system/ws-ovpn.service https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-ovpn.service
#System SSL/TLS Websocket-SSH Python
#wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-stunnel.service

#Install Script Websocket-SSH Python
cd
cd /usr/local/bin/
wget -O /usr/local/bin/ws-openssh https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-openssh && chmod +x /home/admin/ws-openssh
wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-dropbear && chmod +x /home/admin/bin/ws-dropbear
wget -O /usr/local/bin/ws-fauzanvpn https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-fauzanvpn && chmod +x /home/admin/ws-fauzanvpn
wget -O /usr/local/bin/ws-diana https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-diana && chmod +x /home/admin/ws-diana
wget -O /usr/local/bin/ws-hazrian https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-hazrian && chmod +x /home/admin/ws-hazrian
wget -O /usr/local/bin/ws-hazrian https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-wulan && chmod +x /home/admin/ws-wulan
#wget -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws.ovpn && chmod +x /home/admin/ws-ovpn
#wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/ws-stunnel && chmod +x /home/admin/ws-stunnel

#izin permision
chmod +x /usr/local/bin/ws-openssh
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-fauzanvpn
chmod +x /usr/local/bin/ws-diana
chmod +x /usr/local/bin/ws-hazrian
chmod +x /usr/local/bin/ws-wulan
#chmod +x /usr/local/bin/ws-stunnel
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

#Enable & Start & Restart ws-fauzanvpn service
systemctl enable ws-fauzanvpn.service
systemctl start ws-fauzanvpn.service
systemctl restart ws-fauzanvpn.service

#Enable & Start & Restart ws-diana service
systemctl enable ws-diana.service
systemctl start ws-diana.service
systemctl restart ws-diana.service

#Enable & Start & Restart ws-hazrian service
systemctl enable ws-hazrian.service
systemctl start ws-hazrian.service
systemctl restart ws-hazrian.service

#Enable & Start & Restart ws-wulan service
systemctl enable ws-wulan.service
systemctl start ws-wulan.service
systemctl restart ws-wulan.service

#Enable & Start ws-ovpn service
#systemctl enable ws-ovpn.service
#systemctl start ws-ovpn.service
#systemctl restart ws-ovpn.service

#Enable & Start & Restart ws-stunnel service
#systemctl enable ws-stunnel.service
#systemctl start ws-stunnel.service
#systemctl restart ws-stunnel.service


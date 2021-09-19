#!/bin/bash
#installer Websocker tunneling 
#created Bye HideSSH

cd

#Install Script Websocket-SSH Python
wget -O /usr/local/bin/ws-openssh https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/openssh-socket.py
wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/dropbear-ws.py 
wget -O /usr/local/bin/ws-fauzanvpn https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/fauzanvpn-ws.py 
wget -O /usr/local/bin/ws-diana https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/diana-ws.py 
wget -O /usr/local/bin/ws-hazrian https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/hazrian-ws.py 
wget -O /usr/local/bin/ws-wulan https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/hazrian-ws.py 
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

#System OpenSSH Websocket-SSH Python
wget -O /etc/systemd/system/ws-openssh.service https://raw.githubusercontent.com/fardinzaga/websocketssh/master/proxy/service-wsopenssh && chmod +x /etc/systemd/system/ws-openssh.service


#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-openssh.service https://raw.githubusercontent.com/fardinzaga/websocketssh/master/proxy/service-wsopenssh && chmod +x /etc/systemd/system/ws-openssh.service

#System OpenSSH Websocket-SSH Python
wget -O /etc/systemd/system/ws-openssh.service https://raw.githubusercontent.com/fardinzaga/websocketssh/master/proxy/service-wsopenssh && chmod +x /etc/systemd/system/ws-openssh.service

#System OpenSSH Websocket-SSH Python
wget -O /etc/systemd/system/ws-openssh.service https://raw.githubusercontent.com/fardinzaga/websocketssh/master/proxy/service-wsopenssh && chmod +x /etc/systemd/system/ws-openssh.service

#System OpenSSH Websocket-SSH Python
wget -O /etc/systemd/system/ws-openssh.service https://raw.githubusercontent.com/fardinzaga/websocketssh/master/proxy/service-wsopenssh && chmod +x /etc/systemd/system/ws-openssh.service

#System OpenSSH Websocket-SSH Python
wget -O /etc/systemd/system/ws-openssh.service https://raw.githubusercontent.com/fardinzaga/websocketssh/master/proxy/service-wsopenssh && chmod +x /etc/systemd/system/ws-openssh.service


#System SSL/TLS Websocket-SSH Python
#wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/fardinzaga/websocketssh/master/proxy/ws-stunnel.service && chmod +x /etc/systemd/system/ws-stunnel.service

##System Websocket-OpenVPN Python
#wget -O /etc/systemd/system/ws-ovpn.service https://raw.githubusercontent.com/fardinzaga/websocketssh/master/proxy/ws-ovpn.service && chmod +x /etc/systemd/system/ws-ovpn.service

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

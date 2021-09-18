#!/bin/bash
# Mod By Fauzanvpn
# 
# ==================================================

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Indonesia
locality=Indonesia
organization=Fauzanvpn.com
organizationalunit=Fauzanvpn.com
commonname=0.0.0.0
email=Fauzanvpn.com

# simple password minimal
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/fardinzaga/installerssh/master/password"
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# set repo
sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
apt install gnupg gnupg1 gnupg2 -y
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y

# install wget and curl
apt -y install wget curl

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git
echo "clear" >> .profile
echo "echo ================" >> .profile
echo "echo Mod by Fauzanvpn" >> .profile

# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/fardinzaga/installerssh/master/nginx/nginx.conf"
mkdir -p /home/vps/public_html
echo "<pre>Setup Mod By Fauzanvpn</pre>" > /home/vps/public_html/index.html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/fardinzaga/installerssh/master/nginx/vps.conf"
/etc/init.d/nginx restart

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/fardinzaga/installerssh/master/badvpn/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500

# setting port ssh
cd
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 88' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 200' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 5000' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 400' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 523' /etc/ssh/sshd_config
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
/etc/init.d/ssh restart

# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=44/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 77 -p 4000 -p 165 -p 143 -p 109 "/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# install squid
cd
apt -y install squid3
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/fardinzaga/installerssh/master/squid/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# setting dan install vnstat debian 9 64bit
apt-get -y install vnstat
systemctl start vnstat
systemctl enable vnstat
chkconfig vnstat on
chown -R vnstat:vnstat /var/lib/vnstat

# install webmin
apt install webmin -y
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
/etc/init.d/webmin restart


# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[ws-stunnel]
accept = 443
connect = 127.0.0.1:800
[ssldropbear]
accept = 444
connect = 127.0.0.1:44
[ssldropbear]
accept = 777
connect = 127.0.0.1:77
[openvpn]
accept = 992
connect = 127.0.0.1:1194
END

echo "=================  membuat Sertifikat OpenSSL ======================"
echo "========================================================="
#membuat sertifikat
cd /etc/stunnel/
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem
cd
# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
cd
/etc/init.d/stunnel4 restart
cd
apt-get -y install sslh
#configurasi sslh
wget -O /etc/default/sslh "https://raw.githubusercontent.com/fardinzaga/installerssh/master/sslh/sslh.conf"
service sslh restart
/etc/init.d/sslh restart

#!/bin/bash
# Proxy For Edukasi, Imclass & gamemax
# ==============================

# Getting Proxy Template
wget -q -O /usr/local/bin/edu-proxy https://raw.githubusercontent.com/fardinzaga/installerssh/master/websocket/fauzanvpn.py
chmod +x /usr/local/bin/edu-proxy

# Installing Service
cat > /etc/systemd/system/edu-proxy.service << END
[Unit]
Description=Python Edu Proxy By Fauzanvpn
Documentation=Fauzanvpn@gamil.com
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-proxy 80
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable edu-proxy
systemctl restart edu-proxy

clear
echo -e Fauzanvpn

#OpenVPN
wget https://raw.githubusercontent.com/fardinzaga/websocketssh/master/vpn/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# xml parser
cd
apt install -y libxml-parser-perl

# banner /etc/issue.net
wget -O /etc/issue.net "https://raw.githubusercontent.com/fardinzaga/installerssh/master/banner/bannerssh.conf"
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

#install bbr dan optimasi kernel
wget https://raw.githubusercontent.com/fardinzaga/installerssh/master/bbr/bbr.sh && chmod +x bbr.sh && ./bbr.sh
wget https://raw.githubusercontent.com/fardinzaga/installerssh/master/bbr/set-br.sh && chmod +x set-br.sh && ./set-br.sh

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
cd /usr/bin
wget -O addhost "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/slhost.sh"
wget -O about "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/about.sh"
wget -O menu "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/hapus.sh"
wget -O member "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/member.sh"
wget -o webmin "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/webmin.sh"
wget -O delete "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/delete.sh"
wget -O cek "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/cek.sh"
wget -O restart "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/restart.sh"
wget -O info "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/info.sh"
wget -O ram "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/ram.sh"
wget -O renew "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/renew.sh"
wget -O autokick "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/autokick.sh"
wget -O ceklim "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/tendang.sh"
wget -O clear-log "https://raw.githubusercontent.com/fardinzaga/installerssh/master/menu/clear-log.sh"

echo "0 8 * * * root clear-log && reboot" >> /etc/crontab

chmod +x addhost
chmod +x menu
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x webmin
chmod +x cek
chmod +x restart
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renew
chmod +x clear-log

# remove unnecessary files
apt -y autoclean
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt -y autoremove

# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/webmin restart
/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500

history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/ssh-vpn.sh

# finihsing
clear
netstat -nutlp

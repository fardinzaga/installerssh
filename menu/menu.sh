#!/bin/bash
#Menu
clear
echo -e "=============================-Menu-============================="
echo -e "* Script       : Fauzanvpn "
echo -e "* menu         : List of Main Commands "
echo -e ""
echo -e "=========================-SSH & OpenVPN-========================"
echo -e "* usernew      : Buat akun SSH dan OpenVPN"
echo -e "* trial        : Buat akun SSH dan OpenVPN Trial 24 Jam"
echo -e "* renew        : Memperpanjang Masa Aktif Akun SSH & OpenVPN"
echo -e "* deluser      : Hapus akun SSH dan OpenVPN"
echo -e "* member       : Lihat daftar Member akun SSH dan OpenVPN"
echo -e "* delete       : Hapus akun SSH dan OpenVPN yang sudah expired"
echo -e "* autokick     : Tendang User Menggunakan Tendangan Nuklir Mikey"
echo -e "* ceklim       : Tampilkan Multi Login SSH"
echo -e "* restart      : Mulai ulang service SSH WS Python, Dropbear," 
echo -e "                 Webmin,Squid,OpenVPN, SSH dan Stunnel "
echo -e ""
echo -e "=============================-SYSTEM-=========================="
echo -e "* addhost      : Buat domain untuk VPS"
echo -e "* webmin       : Tampilkan menu webmin"
echo -e "* ram          : Cek Penggunaan ram VPS"
echo -e "* reboot       : Reboot VPS"
echo -e "* speedtest    : Tes kecepatan VPS"
echo -e "* info         : Informasi Spek VPS"
echo -e "* about        : Informasi script autossh"
echo -e ""
echo -e "==============================================================="
echo -e ""
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
jam=$(date +"%T")
hari=$(date +"%A")
tnggl=$(date +"%d-%B-%Y")
echo -e "* Waktu         : $jam"
echo -e "* Hari          : $hari"
echo -e "* Tanggal       : $tnggl"
echo -e "* ISP Name      : $ISP"
echo -e "* City          : $CITY"
echo -e "* IP VPS        : $IPVPS"
echo -e ""

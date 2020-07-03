#!/usr/bin/env bash

# update & install
apt update
if [ $? -ne 0 ] ; then
  echo "Error : Fail to update"
  exit 0
else
apt install debconf-utils
if [ $? -ne 0 ] ; then
  echo "Error : Fail to install the packages"
  exit 0
else
debconf-set-selections <<\EOF
proftpd-basic shared/proftpd/inetd_or_standalone select standalone 
EOF
  apt install -y  proftpd nfs-kernel-server samba isc-dhcp-server bind9 expect
  if [ $? -ne 0 ] ; then
    echo "Error : Fail to install the packages"
    exit 0
  fi
fi
fi

# copy the configuration files


cp /etc/proftpd/proftpd.conf  /etc/proftpd/proftpd.conf.copy
cp /etc/exports  /etc/exports.copy
cp /etc/samba/smb.conf  /etc/samba/smb.conf.copy
cp /etc/network/interfaces /etc/network/interfaces.copy
cp /etc/default/isc-dhcp-server /etc/default/isc-dhcp-server.copy
cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.copy
cp /etc/bind/named.conf.local /etc/bind/named.conf.local.copy

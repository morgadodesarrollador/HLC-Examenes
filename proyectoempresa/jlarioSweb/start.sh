#!/bin/bash
set -e

cat addhost >> /etc/host
echo "${HOSTNAME}" > /etc/hostname

useradd -rm -d /home/"adminSSH" -s /bin/bash "adminSSH" 
echo "adminSSH:password" | chpasswd

cat id_rsa.pub >> /home/adminSSH/.ssh/authorized_keys

 
/etc/init.d/ssh start
tail -f /dev/null

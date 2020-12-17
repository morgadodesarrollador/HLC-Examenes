#!/bin/bash
set -e

#-->cat /root/addhosts >> /etc/hosts
cat addhost >> /etc/host
echo "${HOSTNAME}" > /etc/hostname

#debes de usar las variables de entorno del docker-compose ${USUARIO} y ${PASSWD}
useradd -rm -d /home/"adminSSH" -s /bin/bash "adminSSH" 
echo "adminSSH:password" | chpasswd

#debes de usar las variables de entono
cat id_rsa.pub >> /home/adminSSH/.ssh/authorized_keys

#debes de hacer al ${USUARIO} con permisos de sudo
 
/etc/init.d/ssh start
tail -f /dev/null

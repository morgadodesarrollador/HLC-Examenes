#!/bin/bash
set -e
#cat 
cat ./addhosts >> /etc/hosts
echo "manuSweb" > /etc/hostname

#useradd -rm -d /home/"${USUARIO}" -s /bin/bash "${USUARIO}" 
useradd -rm -d /home/"manu" -s /bin/bash "manu" 

#echo "${USUARIO}:${PASSWD}" | chpasswd
echo "manu:1234" | chpasswd

#no creas el directorio .ssh, el cat no te los crea
cat ./id_rsa.pub >> /home/manu/.ssh/authorized_keys
#cat /root/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys

#echo "${USUARIO} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "manu ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
/etc/init.d/ssh start
tail -f /dev/null




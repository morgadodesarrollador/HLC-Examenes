#!/bin/bash

set -e
cp /root/addhosts >> /etc/hosts
#cat  /root/addhosts >> /etc/hosts

#No usas las variables de ENTORNO
useradd -rm -d /home/domenica -s /bin/bash "domenica"
#useradd -rm -d /home/"${USUARIO}" -s /bin/bash "${USUARIO}" 

echo "domenica:1234" | chpasswd
#echo "${USUARIO}:${PASSWD}" | chpasswd 

cp /root/id_rsa.pub /home/domenica/.ssh/authorized_keys
#cat /root/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys

#no haces al usuario de tipo sudo
/etc/init.d/ssh start
tail -f /dev/null

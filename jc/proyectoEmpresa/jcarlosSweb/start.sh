#!/bin/bash
set -e
#NO CREAS EL USUARIO EN FUNCIÓN DE LAS VARIABLES DE ENTORNO
useradd -rm -d /home/$USUARIO -s /bin/bash $USUARIO 
#---> useradd -rm -d /home/"${USUARIO}" -s /bin/bash "${USUARIO}" 

echo "$USUARIO:$PASSWD" | chpasswd
#---> echo "${USUARIO}:${PASSWD}" | chpasswd


#echo /root/addhost >> /etc/hosts
#---> cat /root/addhost >> /etc/hosts

#echo "jcarlos ALL=(ALL) NOPASSWD: ALL">> /etc/sudoers
#---> echo "${USUARIO} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#cat /root/id_rsa.pub >> /home/jcarlos/.ssh/authorized_keys
#---> cat /root/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys

/etc/init.d/ssh start
tail -f /dev/null

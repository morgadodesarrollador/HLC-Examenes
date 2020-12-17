#!/bin/bash
set -e
if [ -d /var/run/apache2 ];
then
    chgrp -R www-data /var/run/apache2
else
    mkdir /var/run/apache2
    chgrp -R www-data /var/run/apache2
fi

source /etc/apache2/envvars
rm -f /var/run/apache2/apache2.pid
echo "ServerName localhost" >> /etc/apache2/apache2.conf

#hostname ${HOSTNAME}
echo  ${HOSTNAME} > /etc/hostname
cat /root/addhosts >> /etc/hosts

useradd -rm -d /home/"${USUARIO}" -s /bin/bash "${USUARIO}" 

mkdir /var/run/sshd
echo "${USUARIO}:${PASSWD}" | chpasswd
#RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
if [ ! -d /home/${USUARIO}/.ssh ]
then
    mkdir /home/${USUARIO}/.ssh
    cat /root/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys
fi

echo "${USUARIO} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

cat /root/addhosts >> /etc/hosts

/etc/init.d/ssh start
/usr/sbin/apache2 -DFOREGROUND



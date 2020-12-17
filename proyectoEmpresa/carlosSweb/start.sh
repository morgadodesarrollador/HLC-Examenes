#!/bin/bash

cat /root/addhosts >> /etc/hosts

useradd -rm -d /home/carlos -s /bin/bash "${USUARIO}"
echo "${USUARIO}:${PASSWD}" | chpasswd

mkdir /home/"${USUARIO}"/.ssh
cat /root/id_rsa.pub > /home/"${USUARIO}"/.ssh/authorized_keys

echo "${USUARIO} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

/etc/init.d/ssh start

echo ${USUARIO}:${PASSWD}

tail -f /dev/null
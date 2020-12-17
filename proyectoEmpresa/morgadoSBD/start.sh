#!/bin/bash
set -e

#hostname ${HOSTNAME}
echo  ${HOSTNAME} > /etc/hostname
cat /root/addhosts >> /etc/hosts


# ---------------- creación de usuario 
echo "MAQ2-->usuarioBD-->${USUARIO}" > /root/datos.txt

useradd -rm -d /home/"${USUARIO}" -s /bin/bash "${USUARIO}" 

#mkdir /var/run/sshd
echo "${USUARIO}:${PASSWD}" | chpasswd
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config


if [ ! -d /home/${USUARIO}/.ssh ]
then
    mkdir /home/${USUARIO}/.ssh
    cat /root/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys
fi

echo "${USUARIO} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

/etc/init.d/ssh start
tail -f /dev/null




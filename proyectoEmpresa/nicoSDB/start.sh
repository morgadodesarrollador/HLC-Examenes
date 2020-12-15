#!/bin/bash
useradd -rm -d /home/"$USUARIO" -s /bin/bash "$USUARIO"
echo "$USUARIO:$PASSWD"

cat/home/id_rsa.pub >> /home/$USUARIO/.ssh/authorized_keys

cat /home/addhosts >> /etc/hosts

echo $usuario ALL=(ALL) NOPASSWD: ALL >> /etc/sudoers

/etc/init.d/ssh Start

tail -f /dev/null
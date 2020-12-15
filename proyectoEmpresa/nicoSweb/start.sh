#!/bin/bash
useradd -rm -d /home/"$USUARIO" -s /bin/bash "$USUARIO"
echo "$USUARIO:$PASSWD" | chpasswd

cat /home/id_rsa.pub >> /home/$USUARIO/.ssh/authorized_keys

cat /root/addhosts >> /etc/hosts

echo "$USUARIO ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

/etc/init.d/ssh start

tail -f /dev/null
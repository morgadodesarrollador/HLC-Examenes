#!/bin/bash
set -e
useradd -rm -d /home/$USUARIO -s /bin/bash $USUARIO 
echo "$USUARIO:$PASSWD" | chpasswd

#echo /root/addhost >> /etc/hosts

#echo "jcarlos ALL=(ALL) NOPASSWD: ALL">> /etc/sudoers
#cat /root/id_rsa.pub >> /home/jcarlos/.ssh/authorized_keys
/etc/init.d/ssh start
tail -f /dev/null

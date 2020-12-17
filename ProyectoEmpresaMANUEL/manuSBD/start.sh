#!/bin/bash
set -e
cat ./addhosts >> /etc/hosts
echo "manuSBD" > /etc/hostname
useradd -rm -d /home/"manu" -s /bin/bash "manu" 
echo "manu:1234" | chpasswd
cat ./id_rsa.pub >> /home/manu/.ssh/authorized_keys
echo "manu ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
/etc/init.d/ssh start
tail -f /dev/null




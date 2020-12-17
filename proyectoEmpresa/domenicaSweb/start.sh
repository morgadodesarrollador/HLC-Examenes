#!/bin/bash

set -e
cp /root/addhosts >> /etc/hosts

useradd -rm -d /home/domenica -s /bin/bash "domenica"
echo "domenica:1234" | chpasswd

cp /root/id_rsa.pub /home/domenica/.ssh/authorized_keys

/etc/init.d/ssh start
tail -f /dev/null

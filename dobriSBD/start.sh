#!/bin/bash
set -e

useradd -rm -d /home/"USUARIO" -s /bin/bash "USUARIO" 
echo "USUARIO:PASSWD" | chpasswd

/etc/init.d/ssh start
tail -f /dev/null
useradd -rm -d /home/"joaquin" -s /bin/bash "joaquin" 
echo "joaquin:1234" | chpasswd



/etc/init.d/ssh start

tail -f /dev/null

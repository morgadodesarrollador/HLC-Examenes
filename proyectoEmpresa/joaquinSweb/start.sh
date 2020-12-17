
#--> debes de crear el usuario usando las v.entorno ${USUARIO} Y ${PASSWD} declaradas en el 
#--> docker-compose
useradd -rm -d /home/"joaquin" -s /bin/bash "joaquin" 
echo "joaquin:1234" | chpasswd

# debes de añadir la id_rsa.pub al authorized_keys y hacerlo sudo

/etc/init.d/ssh start
tail -f /dev/null

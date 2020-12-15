#!/bin/bash

# Añade el addhosts al /etc/hosts
cat /root/addhosts >> /etc/hosts

# Cambio de nombre del docker
echo "${HOSTNAME}" | awk -F "." '{ print $1 }' > /etc/hostname
echo "localhost ${HOSTNAME}" >> /etc/hostname

# Creamos el usuario
useradd -rm -d /home/jperez -s /bin/bash "${USUARIO}"
echo "${USUARIO}:${PASSWD}" | chpasswd

# Copiamos la clave pública al authorized_keys usuario creado
mkdir /home/"${USUARIO}"/.ssh
cat /root/id_rsa.pub > /home/"${USUARIO}"/.ssh/authorized_keys

# Damos permisos para ssh totales al usuario
echo "${USUARIO} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Levantamos el contenedor
/etc/init.d/ssh start
tail -f /dev/null
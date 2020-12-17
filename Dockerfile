FROM ubuntu
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -yq  --no-install-recommends \
apt-utils \
sudo \
nano 
# no installas openssh-server

#Configuracion de usuario
#TODA LA CONFIGURACIÓN DEBE DE HACERSE EN EL entrypoint start.sh puesto que 
#hemos de crear el usuario en función de las variables de entorno definidas en el docker-compose
#estas V.E no son accsibles en el Dockerfile cuyo objetivo es generar la imagen
#deberías de usar ${USUARIO} y ${PASSWD}
#Las variables de entorno son solo accesibles desde el contenedor en EJECUCIÓN
RUN useradd -rm -d /home/johan -s /bin/bash johan && echo "johan:johan" | chpasswd \
&& echo "johan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#Configuracion de SSH
USER root
RUN mkdir /var/run/sshd
#repites chpasswd
RUN echo 'root:johan' | chpasswd \ 
    && mkdir /root/.ssh \
    && chmod 700 /root/.ssh \
    && touch /root/.ssh/authorized_keys

#da fallo al crear al hacer el BUILD pues NO WEXISTE sshd_config pues NO INSTALAS openssh-server
#no se pide entrar con el root
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config \
    && sed -i 's/#AddressFamily any/AddressFamily any/g' /etc/ssh/sshd_config \
    && sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g' /etc/ssh/sshd_config
RUN sed 's@session\srequired\spam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
#Tranferir clave. 
#no se pide accedear con el root via ssh
RUN chmod 700 /root/.ssh/authorized_keys
COPY id_rsa.pub /root/.ssh/id_rsa.pub
RUN  cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
#Transferir clave a usuario
USER johan
RUN mkdir /home/johan/.ssh \
    && chmod 700 /home/johan/.ssh \
    && touch /home/johan/.ssh/authorized_keys \
    && chmod 700 /home/johan/.ssh/authorized_keys
#habría que hacerlo con variables de entorno ${USUARIO} en el entrypoint 
COPY id_rsa.pub /home/johan/.ssh/id_rsa.pub
RUN  cat /home/johan/.ssh/id_rsa.pub >> /home/johan/.ssh/authorized_keys
USER root
EXPOSE 22

#no haces sudo al usuario
CMD ["/usr/sbin/sshd", "-D"]

#te podría haber funcionado si lo hubiese probado en la terminal pues te habrías dado cuenta
#de que no instalas en openss-server

#tampoco copias el addhost al /etc/hosts con lo que es impolsible hacer ssh johan@johanSBD.asir.e
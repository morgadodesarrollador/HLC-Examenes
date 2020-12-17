FROM ubuntu
RUN apt update && apt install -yq --no-install-recommends \
    sudo \
    net-tools \
    iputils-ping \
    openssh-server 
# --> no instalas en cliente de ssh

#--> este fichero debes de copiarlo al /root para luego añadirlo al fichero /etc/hosts
COPY addhosts /etc 

#--> la id_rsa.pub debes de copiarla al /root del contenedor pues en este punto el no existe
#--> el usuario joaquin
COPY id_rsa.pub /joaquin/.ssh/authorized_keys
COPY ./start.sh /root
#---> COPY ./id_rsa.pub /root
#---> COPY ./start.sh /root
#---> COPY ./addhosts /root

RUN chmod +x /root/start.sh
RUN chmod +x /root/start.sh
ENTRYPOINT [ "/root/start.sh" ]
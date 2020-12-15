FROM ubuntu
RUN apt update && apt install -yq --no-install-recommends \
    apt-utils \
    openssh-server sudo -y 
COPY ./addhosts /home
COPY ./id_rsa.pub /home
RUN cat /home/addhosts >> /etc/hosts
COPY ./start.sh /home
RUN chmod +x /var/start.sh
ENTRYPOINT [ "/home/start.sh" ]    
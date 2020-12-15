FROM apachephp_web
RUN apt update && apt install -yq --no-install-recommends \
    apt-utils \
    openssh-server sudo -y 
COPY ./addhosts /home
RUN cat /home/addhosts >> /etc/hosts
COPY ./id_rsa.pub /home
COPY ./start.sh /var
RUN chmod +x /var/start.sh
ENTRYPOINT [ "/home/start.sh" ]    
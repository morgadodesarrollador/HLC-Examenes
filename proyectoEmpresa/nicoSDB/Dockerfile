FROM ubuntu
RUN apt update && apt install -yq --no-install-recommends \
    apt-utils \
    openssh-server \
    sudo 
COPY ./addhosts /root
COPY ./id_rsa.pub /root
COPY ./start.sh /root
RUN chmod +x /root/start.sh
ENTRYPOINT [ "/root/start.sh" ]    
FROM ubuntu
RUN apt update && apt install -yq --no-install-recommends \
    openssh-server \
    openssh-client \
    sudo \
    apt-utils \
    wget \
    nano \
    net-tools \
    iputils-ping

EXPOSE 22

COPY ./addhosts /root
COPY ./id_rsa.pub /root
COPY ./start.sh /root

RUN chmod +x /root/start.sh
ENTRYPOINT [ "/root/sshstart.sh" ]


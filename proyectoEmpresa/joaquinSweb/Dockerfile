FROM ubuntu
RUN apt update && apt install -yq --no-install-recommends \
    sudo \
    net-tools \
    iputils-ping \
    openssh-server 
COPY addhosts /etc
COPY id_rsa.pub /joaquin/.ssh/authorized_keys
COPY ./start.sh /root
RUN chmod +x /root/start.sh
RUN chmod +x /root/start.sh
ENTRYPOINT [ "/root/start.sh" ]
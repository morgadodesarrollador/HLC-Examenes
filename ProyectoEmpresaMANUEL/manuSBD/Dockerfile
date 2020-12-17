FROM ubuntu

RUN apt update && apt install -yq --no-install-recommends \
    openssh-server \
    openssh-client \
    sudo \
    net-tools \
    iputils-ping \


WORKDIR /root
COPY ./addhosts /root
COPY ./id_rsa.pub /root
COPY ./start.sh /root
RUN chmod +x /root/start.sh

ENTRYPOINT [ "/root/start.sh" ]
FROM apache/php
RUN apt update && apt install -yq --no-install-recommends \
    openssh-server \
    openssh-client \
    sudo 

ARG USER
ENV USUARIO=$USER


RUN echo "Build number: $USER"

EXPOSE 80
EXPOSE 22


#RUN ssh-copy-id root@172.128.10.2
COPY ./id_rsa.pub /root
COPY ./start.sh /root
COPY ./addhosts /root

ENTRYPOINT [ "/root/start.sh" ]


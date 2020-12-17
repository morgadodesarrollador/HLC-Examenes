FROM ubuntu
RUN apt update && apt install -yq --no-install-recommends \
    openssh-server \
    openssh-client \
    net-tools \
    iputils-ping \
    sudo

ARG TZ=Europe/Madrid
ENV TZ=${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./start.sh /root 
COPY ./id_rsa.pub /root 
COPY ./addhosts /root 
RUN chmod +x /root/start.sh
ENTRYPOINT ["/root/start.sh"]
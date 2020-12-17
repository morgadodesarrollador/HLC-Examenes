FROM ubuntu
#openssh-server,openssh-client
RUN apt update && apt install -yq --no-install-recommends \
    sudo \
    net-tools \
    iputils-ping \
    openssh-server \
    openssh-client 
#indicamos el timezone
ARG TZ=Europe/Madrid
ENV TZ=${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY ./dome/.ssh/id_rsa /root
COPY addhosts /etc/hosts
COPY ./start.sh /root
RUN chmod +x /root/start.sh
EXPOSE 81
ENTRYPOINT [ "/root/start.sh" ]
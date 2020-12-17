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
#--> COPY ./id_rsa.pub /root
COPY addhosts /etc/hosts
#--> COPY ./addhosts /root
COPY ./start.sh /root
RUN chmod +x /root/start.sh
EXPOSE 81
#no tiene sentido
ENTRYPOINT [ "/root/start.sh" ]
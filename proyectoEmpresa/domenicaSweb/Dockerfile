FROM ubuntu
#openssh-server,openssh-client
RUN apt update && apt install -yq --no-install-recommends \
    sudo \
    openssh-server \
    openssh-client 
#indicamos el timezone
ARG TZ=Europe/Madrid
ENV TZ=${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#instalamos php
RUN apt-get update && apt-get install -y php \
    php-cli \
    php-common \
    php-zip 
COPY ./dome/.ssh/id_rsa /root
COPY addhosts /etc/hosts
COPY ./start.sh /root
RUN chmod +x /root/start.sh
EXPOSE 80
ENTRYPOINT [ "/root/start.sh" ]
FROM ubuntu
RUN apt update && apt install -yq --no-install-recommends \
    openssh-server \
    openssh-client \
    sudo

#No es necesario pues NO INSTALAMOS APACHE
ARG TZ=Europe/Madrid
ENV TZ=${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./id_rsa.pub /root/
COPY ./addhosts /root/
COPY ./start.sh /root/
RUN chmod +x /root/start.sh
ENTRYPOINT ["/root/start.sh"]
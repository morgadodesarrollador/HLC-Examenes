FROM ubuntu
RUN apt update && apt install -yq --no-install-recommends \
openssh-server \ openssh-client \ sudo \ net-tools \ iputils-ping
 
WORKDIR /root
COPY ./start.sh /root
COPY ./id_rsa.pub /root
COPY ./addhosts /root
RUN chmod +x /root/start.sh
 
EXPOSE 80
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
ENTRYPOINT [ "/root/start.sh" ]
FROM ubuntu
RUN apt update && apt install -yq --no-install-recommends \ 
  openssh-server \ 
  openssh-client \ 
  sudo
 
WORKDIR /root
COPY ./start.sh /root
COPY ./addhosts /root
COPY ./id_rsa.pub /root
RUN chmod +x /root/start.sh

ENTRYPOINT [ "/root/start.sh" ]
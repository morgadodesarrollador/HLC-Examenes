FROM ubuntu
RUN apt update && apt install -yq --no-install-recommends \
    openssh-server 
#no instalas sopenssh-client y sudo
WORKDIR /root
COPY start.sh /root/start 
#COPY ./start.sh /rrot/start.sh
RUN chmod +x /root/start.sh
RUN /root/start.sh
#ENTRYPOINT  /root/start.sh

  
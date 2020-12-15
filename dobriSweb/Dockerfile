FROM ubuntu
RUN apt update && apt install -yq --no-install-recommends \
    openssh-server 

WORKDIR /root
COPY start.sh /root/start
RUN chmod +x /root/start.sh
RUN /root/start.sh
  
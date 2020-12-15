FROM ubuntu
RUN apt update && apt install -yq --no-install-recommends \
    openssh-server 


WORKDIR /
COPY start.sh /start
RUN chmod +x /start.sh
RUN /start.sh
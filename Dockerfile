FROM ubuntu
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -yq  --no-install-recommends \
apt-utils \
sudo \
nano 

#Configuracion de usuario
RUN useradd -rm -d /home/johan -s /bin/bash johan && echo "johan:johan" | chpasswd \
&& echo "johan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#Configuracion de SSH
USER root
RUN mkdir /var/run/sshd
RUN echo 'root:johan' | chpasswd \
    && mkdir /root/.ssh \
    && chmod 700 /root/.ssh \
    && touch /root/.ssh/authorized_keys
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config \
    && sed -i 's/#AddressFamily any/AddressFamily any/g' /etc/ssh/sshd_config \
    && sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g' /etc/ssh/sshd_config
RUN sed 's@session\srequired\spam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
#Tranferir clave
RUN chmod 700 /root/.ssh/authorized_keys
COPY id_rsa.pub /root/.ssh/id_rsa.pub
RUN  cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
#Transferir clave a usuario
USER johan
RUN mkdir /home/johan/.ssh \
    && chmod 700 /home/johan/.ssh \
    && touch /home/johan/.ssh/authorized_keys \
    && chmod 700 /home/johan/.ssh/authorized_keys
COPY id_rsa.pub /home/johan/.ssh/id_rsa.pub
RUN  cat /home/johan/.ssh/id_rsa.pub >> /home/johan/.ssh/authorized_keys
USER root
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
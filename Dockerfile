FROM ubuntu:20.04
RUN apt-get update
RUN apt-get -y install ca-certificates curl gnupg lsb-release
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install docker-ce docker-ce-cli containerd.io
RUN apt-get -y install fish htop mc
RUN apt-get -y install sudo

RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash -
RUN sudo apt-get install -y nodejs

ARG username=username
RUN adduser --disabled-password --gecos '' ${username}
RUN adduser ${username} sudo
RUN adduser ${username} daemon
RUN apt-get -y install nano vim iputils-ping

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ${username}
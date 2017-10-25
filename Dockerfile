FROM debian:stable

MAINTAINER  Bjoern Heneka <bheneka@codebee.de>

RUN apt-get update && \
    apt-get install -y \
    vim \
    gnupg2 && \
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >  /etc/apt/sources.list.d/ansible.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    apt-get update && \
    apt-get install -y ansible && \
    rm -rf /var/lib/apt/lists/*

COPY ansible.sh /ansible.sh

RUN mkdir /app && \
    mkdir /ssh-keys && \
    chmod +x /ansible.sh

WORKDIR /app

ENTRYPOINT ["/ansible.sh"]

#!/bin/bash

# install docker


##########################################################
##


function install_docker() {  

   sudo apt-get update
   sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg-agent \
     software-properties-common \
     bridge-utils \
     glances 

   sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo apt-key fingerprint 0EBFCD88
   sudo add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"
   
   sudo apt-get install docker-ce docker-ce-cli containerd.io -y

   sudo groupadd docker
   sudo usermod -aG docker vagrant
   


   # install docker compose
   sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   sudo chmod +x /usr/local/bin/docker-compose


}

install_docker


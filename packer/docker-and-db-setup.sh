#!/bin/bash
set -x
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common nfs-common fail2ban
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo usermod -aG docker ubuntu
sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker pull mariadb:10.6
sudo docker pull phpmyadmin:5.0
sudo docker pull splunk/universalforwarder:8.0

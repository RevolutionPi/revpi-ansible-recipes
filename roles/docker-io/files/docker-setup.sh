#!/bin/bash

# docker-setup.sh

curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
sudo sh /tmp/get-docker.sh
sudo docker run hello-world
sudo usermod -aG docker pi

# restart shell
exit

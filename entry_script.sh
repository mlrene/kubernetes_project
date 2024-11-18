#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt install docker -y
sudo systemctl start docker
sudo usermod -aG docker ubuntu

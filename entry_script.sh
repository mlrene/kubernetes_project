#!/bin/bash
sudo yum update -y
sudo yum upgrade -y
sudo yum install docker -y
sudo systemctl start docker
sudo usermod -aG docker ec2-user

#!/bin/bash 

yum update
yum install docker -y
sudo systemctl restart docker && sudo systemctl enable docker
curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
cat <<EOF >/home/ec2-user/docker-compose.yml
version: '3.8'
services:
  deploydemo:
    image: nginxdemos/hello:latest
    ports:
       - "3306:80"
EOF
chown ec2-user:ec2-user /home/ec2-user/docker-compose.yml
sudo /usr/local/bin/docker-compose -f /home/ec2-user/docker-compose.yml up -d
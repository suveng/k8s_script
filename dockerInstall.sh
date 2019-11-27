#!/usr/bin/env bash
# 卸载原来的docker
sudo yum remove -y docker \
docker-ce docker-ce-cli  docker-client \
docker-client-latest \
docker-common \
docker-latest \
docker-latest-logrotate \
docker-logrotate \
docker-engine
# 安装docker-ce-18.09.9-3.el7
yum install -y yum-utils   device-mapper-persistent-data   lvm2

sudo yum-config-manager \
    --add-repo  https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce-18.09.9-3.el7  docker-ce-cli-18.09.9-3.el7  containerd.io

systemctl enable --now docker

systemctl start docker

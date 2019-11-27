#!/usr/bin/env bash
if [ ! -d '/etc/docker'  ];then
  mkdir -p /etc/docker
else
  echo '/etc/docker/ 目录存在'
fi
# 设置国内源
echo '设置国内源'
echo '{"registry-mirrors": ["https://m3lbzk97.mirror.aliyuncs.com"],"insecure-registries": ["192.168.9.233:30080"]}' > /etc/docker/daemon.json

# 重启docker
echo '重启docker'
systemctl restart docker

# 拉取
sleep 3s

docker pull 192.168.9.233:30080/k8s.gcr.io/kube-proxy:v1.14.1
docker pull 192.168.9.233:30080/k8s.gcr.io/kube-apiserver:v1.14.1
docker pull 192.168.9.233:30080/k8s.gcr.io/kube-scheduler:v1.14.1
docker pull 192.168.9.233:30080/k8s.gcr.io/kube-controller-manager:v1.14.1
docker pull 192.168.9.233:30080/k8s.gcr.io/coredns:1.3.1
docker pull 192.168.9.233:30080/k8s.gcr.io/etcd:3.3.10
docker pull 192.168.9.233:30080/k8s.gcr.io/pause:3.1
docker pull 192.168.9.233:30080/quay.io/coreos/flannel:v0.11.0-amd64

# 重命名
sleep 1s

docker tag 192.168.9.233:30080/k8s.gcr.io/kube-proxy:v1.14.1 k8s.gcr.io/kube-proxy:v1.14.1

docker tag 192.168.9.233:30080/k8s.gcr.io/kube-apiserver:v1.14.1 k8s.gcr.io/kube-apiserver:v1.14.1

docker tag 192.168.9.233:30080/k8s.gcr.io/kube-scheduler:v1.14.1 k8s.gcr.io/kube-scheduler:v1.14.1

docker tag 192.168.9.233:30080/k8s.gcr.io/kube-controller-manager:v1.14.1 k8s.gcr.io/kube-controller-manager:v1.14.1

docker tag 192.168.9.233:30080/k8s.gcr.io/coredns:1.3.1 k8s.gcr.io/coredns:1.3.1

docker tag 192.168.9.233:30080/k8s.gcr.io/etcd:3.3.10 k8s.gcr.io/etcd:3.3.10

docker tag 192.168.9.233:30080/k8s.gcr.io/pause:3.1 k8s.gcr.io/pause:3.1

docker tag 192.168.9.233:30080/quay.io/coreos/flannel:v0.11.0-amd64 quay.io/coreos/flannel:v0.11.0-amd64
# 删除
sleep 1s
docker rmi 192.168.9.233:30080/k8s.gcr.io/kube-proxy:v1.14.1
docker rmi 192.168.9.233:30080/k8s.gcr.io/kube-apiserver:v1.14.1
docker rmi 192.168.9.233:30080/k8s.gcr.io/kube-scheduler:v1.14.1
docker rmi 192.168.9.233:30080/k8s.gcr.io/kube-controller-manager:v1.14.1
docker rmi 192.168.9.233:30080/k8s.gcr.io/coredns:1.3.1
docker rmi 192.168.9.233:30080/k8s.gcr.io/etcd:3.3.10
docker rmi 192.168.9.233:30080/k8s.gcr.io/pause:3.1
docker rmi 192.168.9.233:30080/quay.io/coreos/flannel:v0.11.0-amd64

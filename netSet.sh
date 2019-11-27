#!/usr/bin/env bash
#1.复制master的/etc/kubernetes/admin.conf
#2.创建文件夹
#3.简历master的集群环境
if [ ! -d ~/.kube/ ]; then
    mkdir -p $HOME/.kube
fi

if [ ! -f ~/admin.conf ]; then
    echo 'admin.conf不存在,请复制过来'
    exit 1
fi

cp /root/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
# 设置网络
kubectl apply -f  kube-flannel.yml

#注意，生产不能运行这一步，所有的pod都会运行不了，失去通信
kubectl delete -f kube-flannel.yml
kubectl apply -f kube-flannel.yml

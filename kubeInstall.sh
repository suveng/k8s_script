#!/usr/bin/env bash

# 国内yum源设置
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=http://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=http://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg
       http://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF

# 安装kubelet kubeadm kubectl
yum install -y kubelet-1.14.1 kubeadm-1.14.1 kubectl-1.14.1 --disableexcludes=kubernetes

# 开机启动kubelet
systemctl enable kubelet
systemctl start kubelet

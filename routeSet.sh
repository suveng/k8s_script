#!/usr/bin/env bash
# centos7用户还需要设置路由
yum install -y bridge-utils.x86_64

# 加载br_netfilter模块，使用lsmod查看开启的模块
modprobe  br_netfilter

cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

# 重新加载所有配置文件
sysctl --system



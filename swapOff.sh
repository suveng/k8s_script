#!/usr/bin/env bash
# k8s要求关闭swap  (qxl)
swapoff -a && sysctl -w vm.swappiness=0  # 关闭swap
sed -ri '/^[^#]*swap/s@^@#@' /etc/fstab  # 取消开机挂载swap

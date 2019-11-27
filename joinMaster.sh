#!/usr/bin/env bash

kubeadm join 192.168.9.208:6443 --token pf6t0d.qd9ilz2ji5pv6n0j \
    --discovery-token-ca-cert-hash sha256:9d546ec69994c889e46bf791e4e9689cf1aa15adee5ea31de0a5a47e6b86144b

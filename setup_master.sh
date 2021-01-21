#!/bin/bash

set -eu

sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

sudo swapoff -a

sudo kubeadm init

[[ -f "calico.yaml" ]] || {
    curl https://docs.projectcalico.org/manifests/calico-etcd.yaml -o calico.yml
    echo "Update calico.yml"
    exit 0
}

kubectl apply -f calico.yaml

sleep 5
kubectl get pods --all-namespaces

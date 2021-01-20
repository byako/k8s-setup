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

curl https://docs.projectcalico.org/manifests/calico-etcd.yaml -o calico.yaml
sed -i 's/etcd_endpoints:.*/etcd_endpoints: "https:\/\/127.0.0.1:2379"/' calico.yaml
# manually add certificates from /etc/kubernetes/pki/etcd/
# - server.key
# - server.crt
# - ca.crt
# cat $file | base64 -w 0

# manually fix 0400 mask for mounting secret volume to 0440

sleep 5  # give chance to ^c

kubectl apply -f calico.yaml

sleep 5
kubectl get pods --all-namespaces

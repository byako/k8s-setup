# k8s quickstart:

- Create kvm machine with no SWAP (it is OFF by default)
- Make sure there is no SWAP
- [Install kubectl, kubelet, kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)
- Init cluster:
```
kubeadm init
```
- Observe pods. coredns pods are not expected to be in `Running` state until network addon is installed
- if you have more nodes to join - use line from the `kubeadm init` output's end to join other nodes, for instance:
```
sudo kubeadm join 192.168.122.174:6443 --token uvoibl.eovc8r76hgz525pg     --discovery-token-ca-cert-hash sha256:afefa4c574f552a0b11ceaa90dbf94c8gse4f7a714fc5c3312ca792b050a872f
```
- [Install Calico network addon](https://docs.projectcalico.org/getting-started/kubernetes/self-managed-onprem/onpremises):
  - Download [manifest](https://docs.projectcalico.org/manifests/calico-etcd.yaml)
  - Get base64 values of your server's datastore (etcd by default) HTTPS secrets
```
cat /etc/kubernetes/pki/etcd/ca.crt | base64 -w 0
cat /etc/kubernetes/pki/etcd/server.key | base64 -w 0
cat /etc/kubernetes/pki/etcd/server.crt | base64 -w 0
```
  - Edit yaml:
    - Change etcd endpoints for Calico to use your master-node's etcd:
```
sed -i 's/etcd_endpoints:.*/etcd_endpoints: "https:\/\/<master-node-ip>:2379"/' calico-etcd.yaml
```
    - Uncomment and populate `etcd-ca`, `etcd-cert`, `etcd-key` field in `calico-etcd-secrets` secret in the beginning of the file
    - Uncomment and populate secrets to be mounted in config-map `calico-config`
```
  etcd_ca: "/calico-secrets/etcd-ca"
  etcd_cert: "/calico-secrets/etcd-cert"
  etcd_key: "/calico-secrets/etcd-key"
```
    - Fix 0400 mask for mounting secret volume to 0440
    - Install calico
```
kubectl apply -f calico-etcd.yml
```
- Observe pods. coredns pods are supposed to be in `Running` state soon
```
kubectl get pods -w --all-namespaces
```
- Deploy demo-payload
```
kubectl apply -f demo-payload/demo-deployment.yml
```

## [Get kubectl](https://v1-18.docs.kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux)

### Why isn't there /latest/ like minikube has ?
```
$ wget -c "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"              
```

## Check version

```
$ kubectl version --client
Client Version: version.Info{Major:"1", Minor:"20", GitVersion:"v1.20.2", GitCommit:"faecb196815e248d3ecfb03c680a4507229c2a56", GitTreeState:"clean", BuildDate:"2021-01-13T13:28:09Z", GoVersion:"go1.15.5", Compiler:"gc", Platform:"linux/amd64"}
```

## [Install minikube](https://v1-18.docs.kubernetes.io/docs/tasks/tools/install-minikube/)

```
wget -c https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
```

## Start cluster

```
minikube start
```

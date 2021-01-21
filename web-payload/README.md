## Deploy
```shell
kubectl apply -f pup-pad-deployment.yml
```

## Expose
```shell
kubectl expose deployment --type=LoadBalancer --name=pup-pad-service
```

## Access non-balanced

Default setup has no balancer, but nodeport is used per service
```shell
kubectl get services
```
Observe NodePort and access http://yourNodeIp:NodePort


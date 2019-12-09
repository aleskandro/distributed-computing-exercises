Start the minikube VM

```minikube start --vm-driver=kvm2```

Create the server.js

Create the dockerfile

Build the docker image

``` docker build -t minikube-second:v1 . ```

To deploy:

```
    kubectl apply -f ./k8s
```

To "un"-deploy:

```
    kubectl delete -f ./k8s
```

```
    kubectl get pods
    kubectl get deployment
    kubectl describe deployment hello-node
    kubectl describe service hello-node
```

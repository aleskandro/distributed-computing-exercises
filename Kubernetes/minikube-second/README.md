Start the minikube VM

```minikube start --vm-driver=kvm2```

Create the server.js

Create the dockerfile

Build the docker image

``` docker build -t minikube-second:v1 . ```

To deploy:

```
    kubectl apply -f deployment.yml
    kubectl apply -f service.yml
```

To "un"-deploy:

```
    kubectl delete -f deployment.yml
    kubectl delete -f deployment.yml

```

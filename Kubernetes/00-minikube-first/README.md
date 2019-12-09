Start/Create the minikube VM

```minikube start --memory=4096 --vm-driver=kvm2```

Create the server.js

Create the dockerfile

Build the docker image

``` docker build -t minikube-first:v1 . ```

``` kubectl create deployment hello-node --image=minikube-first:v1 ```

```
deployment.apps/hello-node created
```

```
seraph minikube-first # kubectl get deployments
NAME         READY   UP-TO-DATE   AVAILABLE   AGE
hello-node   1/1     1            1           7s
```

```
kubectl get pods
NAME                          READY   STATUS    RESTARTS   AGE
hello-node-5868dd5747-qr8nb   1/1     Running   0          68s
```

```
kubectl expose deployment hello-node --type=LoadBalancer --port=8080

minikube service hello-node --url
```

```
curl $outputurlfrompreviouscommand/$something
```

```
kubectl delete service hello-node
service "hello-node" deleted
seraph minikube-first # kubectl delete deployment hello-node
deployment.extensions "hello-node" deleted
```

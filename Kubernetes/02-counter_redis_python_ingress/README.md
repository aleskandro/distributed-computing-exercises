
```
eval $(minikube docker-env)
docker build -t pycounter-stateless:v1 pythonapp/
docker build -t pycounter-redis:v1 redis/
docker build -t pycounter-frontend:v1 frontend/
minikube addons enable ingress
```

```
kubectl apply -f k8s

minikube service pycounter-frontend --url

kubectl scale deployment.apps/pycounter --replicas=10

use the browser to try the ajax request
```

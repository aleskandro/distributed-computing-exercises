

## ConfigMaps \& secrets

kubectl create configmap user-service-db-env-file --from-env-file=./user-service/user-service-db-env-file.properties --save-config

kubectl get configmap user-service-db-env-file -o yaml > user-service/user-service-db-configmap.yml

kubectl create secret generic user-service-db-secret-file --from-env-file=./user-service/user-service-db-secret-file.properties --save-config

kubectl get secret user-service-db-secret-file -o yaml > user-service/user-service-db-secret-file.yml

kubectl create configmap user-service-env-file --from-env-file=./user-service/user-service-env-file.properties --save-config

kubectl get configmap user-service-env-file -o yaml > user-service/user-service-configmap.yml

kubectl create configmap order-service-db-env-file --from-env-file=./order-service/order-service-db-env-file.properties --save-config

kubectl get configmap order-service-db-env-file -o yaml > order-service/order-service-db-configmap.yml

kubectl create secret generic order-service-db-secret-file --from-env-file=./order-service/order-service-db-secret-file.properties --save-config

kubectl get secret order-service-db-secret-file -o yaml > order-service/order-service-db-secret-file.yml

kubectl create configmap order-service-env-file --from-env-file=./order-service/order-service-env-file.properties --save-config

kubectl get configmap order-service-env-file -o yaml > order-service/order-service-configmap.yml 

## Maven

The Maven pom file is configured in order to provide two profiles per each project: development and production. In the development one the exludeDevTools property is set to false so that you can trigger from IntelliJ or any IDE the live reload server to restart the application whenever the code changes.
This capability has to be disabled in production environemnt for security purposes.

## Development environment

Run on Minikube.
Be sure the package has been built before running these stages by your IDE (or in command line: $ mvn package -P development)
```
    eval $(minikube docker-env)
    docker build -t order-service:v1 -f order-service/Dockerfile-dev ./order-service
    docker build -t user-service:v1 -f user-service/Dockerfile-dev ./user-service
    kubectl apply -f k8s/development/kafka
    kubectl apply -f k8s/development/order-service
    kubectl apply -f k8s/development/user-service
    kubectl apply -f k8s/development/proxy
```

## Production environment

Run on Minikube.

```
    eval $(minikube docker-env)
    docker build -t order-service-prod:v1 -f order-service/Dockerfile-prod ./order-service
    docker build -t user-service-prod:v1 -f user-service/Dockerfile-prod ./user-service
    kubectl apply -f k8s/production/kafka
    kubectl apply -f k8s/production/order-service
    kubectl apply -f k8s/production/user-service
    kubectl apply -f k8s/production/proxt
```

## /etc/hosts

```sh
echo "$(minikube ip) springexample.localhost springexample.dev.localhost" | sudo tee -a /etc/hosts
```



## ConfigMaps \& secrets

kubectl create configmap user-service-db-env-file --from-env-file=./user-service-db-env-file.properties

kubectl get configmap user-service-db-env-file -o yaml > user-service-db-configmap.yml

kubectl create secret generic user-service-db-secret-file --from-env-file=./user-service-db-secret-file.properties

kubectl get secret user-service-db-secret-file -o yaml > user-service-db-secret-file.yml

kubectl create configmap user-service-env-file --from-env-file=./user-service-env-file.properties

kubectl get configmap user-service-env-file -o yaml > user-service-configmap.yml

kubectl create configmap order-service-db-env-file --from-env-file=./order-service-db-env-file.properties

kubectl get configmap order-service-db-env-file -o yaml > order-service-db-configmap.yml

kubectl create secret generic order-service-db-secret-file --from-env-file=./order-service-db-secret-file.properties

kubectl get secret order-service-db-secret-file -o yaml > order-service-db-secret-file.yml

kubectl create configmap order-service-env-file --from-env-file=./order-service-env-file.properties

kubectl get configmap order-service-env-file -o yaml > order-service-configmap.yml

## Maven

The Maven pom file is configured in order to provide two profiles per each project: development and production. In the development one the exludeDevTools property is set to false so that you can trigger from IntelliJ or any IDE the live reload server to restart the application whenever the code changes.
This capability has to be disabled in production environemnt for security purposes.

## Development environment

Run on Minikube.
Be sure the package has been built before running these stages by your IDE (or in command line: $ mvn package -P development)
```
    eval $(minikube docker-env)
    cd order-service
    docker build -t order-service:v1 -f Dockerfile-dev ./
    cd ..
    cd user-service
    docker build -t user-service:v1 -f Dockerfile-dev ./
    kubectl apply -f deploy/development/kafka
    kubectl apply -f deploy/development/order-service
    kubectl apply -f deploy/development/user-service
```


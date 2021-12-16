## Development environment

Run on Minikube.
Be sure the package has been built before running these stages by your IDE (or in command line: $ mvn package -P development)
```
    eval $(minikube docker-env)
    minikube addons enable ingress
    docker build -t order-service:v1 ./order-service
    docker build -t user-service:v1 ./user-service
    kubectl apply -f k8s/
```

## /etc/hosts

```sh
echo "$(minikube ip) springexample.dev.loc" | sudo tee -a /etc/hosts
```

## Demo

```
# Create a user
curl springexample.dev.loc/users -X POST -H "Content-Type: application/json" -d '{"name": "Elliot"}'

# Create an order
curl springexample.dev.loc/orders -X POST -H "Content-Type: application/json" -d '{"description":"my order", "user": "...."}

# Get the orders
curl springexample.dev.loc/orders

```

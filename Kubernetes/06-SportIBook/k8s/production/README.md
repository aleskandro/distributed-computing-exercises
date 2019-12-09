# Arguments

- Ingress controller
- Secrets
- ConfigMaps
- Jobs

## ConfigMaps

Use the examples in envsecrets to fill the right properties files

Then

```

kubectl create configmap sportibook-backend-env-file --from-env-file=envsecrets/backend.properties

kubectl get configmap sportibook-backend-env-file -o yaml > backend.configmap.yml

kubectl create configmap sportibook-db-env-file --from-env-file=envsecrets/db.properties

kubectl get configmap sportibook-db-env-file -o yaml > db.configmap.yml


```

# Secrets


```
kubectl create secret generic sportibook-db-secret-file --from-env-file=envsecrets/db.secrets

kubectl get secret sportibook-db-secret-file -o yaml > db.secret.yml
```

```
kubectl create secret generic sportibook-backend-secret-file --from-env-file=envsecrets/backend.secrets

kubectl get secret sportibook-backend-secret-file -o yaml > backend.secret.yml
```

# Jobs

Two jobs are created in order to create the database if it doesn't exist and to apply migrations in the database.

The job created has to be re-run in a CD workflow whenever the backend image is rolled:

```
kubectl get job "sportibook-migrations" -o json | kubectl replace --force -f -
```

# Running

First create configmaps and secrets as in the previous sections.
Then

```
eval $(minikube docker-env)
minikube addons enable ingress
cd ..
docker build -t sportibook-backend:v1 backend/ -f backend/Dockerfile.production
docker build -t sportibook-db:v1 docker/mariadb/
cd frontend
docker build -t sportibook-frontend:v1 . -f Dockerfile.production
kubectl apply -f kubernetes/production
```

Get the IP of the ingress with

```kubectl get ingress```

Set this ip to point on the services url with:

```
192.168.122.229 api.sportibook.localhost sportibook.localhost
```
You can now reach the services using api.sportibook.localhost and sportibook.localhost on your browser

## Import the dump

```
kubectl exec -i sportibook-db-58d85898d6-llpnn -- mysql -u root -proot isportbook_production < mysql-dump/dump.sql
```

Replace the pod name with the proper one in your deployment by using kubectl get pods



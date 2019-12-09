docker build -t pycounter:v1 .

minikube mount /path/to/counter/code:/counter
kubectl apply -f k8s/
minikube service counter --url

kubectl delete -f k8s/

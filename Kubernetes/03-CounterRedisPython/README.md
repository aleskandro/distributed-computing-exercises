docker build -t pycounter:v1 .

minikube mount /path/to/counter/code:/counter
kubectl apply -f kubernetes/
minikube service counter --url

kubectl delete -f templates/

docker build -t pycounter:v1 .

minikube mount /path/to/counter/code:/counter

kubectl apply -f templates/

minikube service counter --url

curl $(minikube service counter --url)

kubectl delete -f templates/

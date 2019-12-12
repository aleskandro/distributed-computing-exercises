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


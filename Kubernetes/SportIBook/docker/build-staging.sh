docker build -t sportibook-mariadb-staging:latest mariadb/
cd ../backend
docker build -t sportibook-backend-staging:latest . -f Dockerfile.staging
cd ../docker/proxy
docker build -t sportibook-proxy-staging:latest . -f Dockerfile.staging
cd ../../frontend
docker build -t sportibook-frontend-staging:latest . -f Dockerfile.staging


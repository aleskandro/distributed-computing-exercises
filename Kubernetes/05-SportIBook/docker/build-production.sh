docker build -t sportibook-mariadb-production:latest mariadb/
cd ../backend
docker build -t sportibook-backend-production:latest . -f Dockerfile.production
cd ../docker/proxy
docker build -t sportibook-proxy-production:latest . -f Dockerfile.production
cd ../../frontend
docker build -t sportibook-frontend-production:latest . -f Dockerfile.production


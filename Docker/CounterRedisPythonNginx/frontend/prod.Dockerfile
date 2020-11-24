FROM nginx:1-alpine
COPY etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
WORKDIR /webapp
COPY ./src .

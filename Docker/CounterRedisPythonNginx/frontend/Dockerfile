FROM nginx:1-alpine
COPY etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
RUN mkdir /webapp
COPY src/index.html /webapp/index.html
WORKDIR /webapp


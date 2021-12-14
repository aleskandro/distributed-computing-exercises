FROM nginx:1-alpine
COPY etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
RUN mkdir /webapp
WORKDIR /webapp
COPY src/* ./
RUN chown nginx:nginx -R ./

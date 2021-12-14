FROM redis:5-alpine
COPY redis.conf /etc/
RUN chmod 644 /etc/redis.conf
CMD [ "redis-server", "/etc/redis.conf" ]


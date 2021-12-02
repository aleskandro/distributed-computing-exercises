FROM maven:3-openjdk-17-slim
# Download dependencies
# Execute the java application
# Reload the java application at fs changes
# Wait for mongo db readiness before starting the application

RUN apt-get -y update && apt-get -y install inotify-tools wget gnupg2 && \
    wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add - && \
    echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | \
    tee /etc/apt/sources.list.d/mongodb-org-4.4.list && apt-get -y update && \
    apt-get -y install mongodb-org-shell && apt-get clean && rm -rf /var/cache/apt/*

WORKDIR /code

COPY root/ /
RUN chmod 755 /usr/local/bin/*.sh

VOLUME /code

ENTRYPOINT ["/bin/sh", "-c" ]
CMD ["/usr/local/bin/reloader.sh"]
# Add WAIT_MONGO as argument to let the container waiting for a mongo instance before starting the application

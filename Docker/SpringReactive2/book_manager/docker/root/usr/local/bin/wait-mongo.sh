#!/bin/sh

while ! mongo -u "$MONGO_USER" -p "$MONGO_PASSWORD" \
  --authenticationDatabase "$MONGO_AUTH_DB" \
  "$MONGO_HOST:$MONGO_PORT/$MONGO_AUTH_DB" --eval "db.version()" > /dev/null 2>&1
do
  echo "Waiting for DB..."
  sleep 5
done

echo "DB is Ready... starting the application"

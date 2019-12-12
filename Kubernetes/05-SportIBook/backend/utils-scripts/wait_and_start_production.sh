#!/bin/sh
# Wait for database to get available

M_LOOPS="10"
START_CMD="uwsgi /etc/uwsgi.ini"
 
#wait for mysql
i=0
# http://stackoverflow.com/a/19956266/4848859
while ! mysqladmin -u$DB_USER -p$DB_PASSWORD -h $DB_HOST status  >/dev/null 2>&1 < /dev/null; do
  i=`expr $i + 1`

  if [ $i -ge $M_LOOPS ]; then
    echo "$(date) - ${DB_HOST}:${DB_PORT} still not reachable, giving up"
    exit 1
  fi

  echo "$(date) - waiting for ${DB_HOST}:${DB_PORT}..."
  sleep 3
done

echo "$(date) - ${DB_HOST}:${DB_PORT} Reachable ! - Starting Daemon"
#start the daemon
python3 manage.py migrate
python3 manage.py collectstatic --noinput
exec $START_CMD


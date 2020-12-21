#!/bin/sh

load() {
  mvn package
  java -jar target/*.jar &
}

killer() {
  killall -9 java || echo "NO PROCESS FOUND... Ignoring"
}

watch() {
  inotifywait -m -r ./ -e close_write -e delete --excludei "(docker|.mvn|target)" | \
  while read path action file; do
    if echo "$file" | grep -q -E ".*\(.properties|.java|.xml\)$"; then
      echo "Detected a change into $path/$file: $action"
      echo "Reloading..."
      killer
      load
    fi
  done
}

killer
#/usr/local/bin/wait-mongo.sh
load
watch

#!/bin/sh

killer() {
  killall -9 java || echo "NO PROCESS FOUND... Ignoring"
}

watch() {
  inotifywait -m -r ./ -e close_write --excludei "(docker|.mvn|target)" | \
  while read PATH_CH ACTION FILE_CH; do
    if echo "$FILE_CH" | grep -q "^.*\(\.properties\|\.java\|\.xml\)$"; then
      echo "Detected a change into ${PATH_CH}${FILE_CH}: ${ACTION}"
      echo "Reloading..."
      mvn package && killer && java -jar target/*.jar &
    fi
  done
}

mvn package
[ x"$1" = x"WAIT_MONGO" ] && /usr/local/bin/wait-mongo.sh
java -jar target/*.jar &
watch

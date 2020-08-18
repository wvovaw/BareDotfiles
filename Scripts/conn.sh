#!/bin/sh
main() {
  wget -q --tries=1 --timeout=1 --spider http://gnu.org > /dev/null
  if [ $? -eq 0 ]; then
    export ONLINE=1
    echo 'Online!'
  else
    export ONLINE=0
    echo 'Offline'
  fi
}
while true; do
  main
  sleep 10
done

#!/usr/bin/dumb-init /bin/bash
log() {
  >&2 echo "{ \"time\": \"$(date -Is)\", \"log\": \"$*\"}"
}

log "Start fastcgi"
fastcgi-mono-server4 --applications=/:. --socket=tcp:127.0.0.1:9000 &
log "Start nginx"
nginx -g 'daemon off;' &
wait -n
log "Exit..."

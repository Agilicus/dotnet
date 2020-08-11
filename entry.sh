#!/usr/bin/dumb-init /bin/bash
log() {
  >&2 echo "{ \"time\": \"$(date -Is)\", \"log\": \"$*\"}"
}

wait_ready() {
    set -a
    SCRIPT_NAME=/
    SCRIPT_FILENAME=/
    QUERY_STRING= REQUEST_URI=/
    REQUEST_METHOD=GET
    until cgi-fcgi -bind -connect 127.0.0.1:9000 |grep -q "Status: 200 OK"
    do
        log "Wait for fastcgi-mono to be ready"
        sleep 1
    done
}

log "Start fastcgi"
fastcgi-mono-server4 --applications=/:. --socket=tcp:127.0.0.1:9000 &
wait_ready
log "Start openresty"
/usr/local/openresty/bin/openresty -g 'daemon off;' &
wait -n
log "Exit..."

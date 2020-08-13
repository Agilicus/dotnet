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

wait_ready_dnc() {
    set -a
    ntries=0
    SCRIPT_NAME=/
    SCRIPT_FILENAME=/
    QUERY_STRING= REQUEST_URI=/
    REQUEST_METHOD=GET
    until curl -sq localhost:9000 >/dev/null 2>&1
    do
        ntries=$((ntries+1))
        if [ $ntries -gt 30 ]
        then
	    log "Error: dotnet application didn't start (check ENTRY environment variable)"
            exit 1
        fi
        log "Wait for dotnetcore to be ready"
        sleep 1
    done
}

export ASPNETCORE_URLS=http://0.0.0.0:9000

grep -q aspNetCore [wW]eb.config
if [ $? -eq 0 ]
then
    log "Assume dotnetcore runtime"
    mv /rules/server.d/root.conf.dnc /rules/server.d/root.conf
    if [ -z "$ENTRY" ]
    then
	pp=$(xml2 < [wW]eb.config | awk -F =  '/processPath/ { sub("^[^a-zA-Z0-9]*", "", $2); print $2}')
	pa=$(xml2 < [wW]eb.config | awk -F =  '/arguments/ { sub("^[^a-zA-Z0-9]*", "", $2); print $2}')
	log "processPath: <<$pp>>, arguments: <<$pa>>"
	if [ "$pp" = "dotnet" ]
	then
	    ENTRY="$pa"
	else
	    ENTRY="$pp"
	fi
    fi
    if [ ! -f "$ENTRY" ]
    then
	log "Error: <<$ENTRY>> does not exist in /app directory"
	log "In /app, I see:"
	ls
	exit 1
    fi
    log "Start dotnetcore for <<$ENTRY>>"
    dotnet $ENTRY &
else
    log "Assume .NET runtime"
    log "Start fastcgi"
    mv /rules/server.d/root.conf.xsp /rules/server.d/root.conf
    fastcgi-mono-server4 --applications=/:. --socket=tcp:127.0.0.1:9000 &
    wait_ready
fi

log "Start openresty"
openresty -g 'daemon off;' &
wait -n
log "Exit..."

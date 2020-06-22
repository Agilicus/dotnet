#!/usr/bin/dumb-init /bin/bash
log() {
  >&2 echo "{ \"time\": \"$(date -Is)\", \"log\": \"$*\"}"
}

wait_ready() {
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

# Make an assumption the most recent dll is the entrypoint
#ENTRY=$(ls -tr *.runtimeconfig.json | tail -1)
#ENTRY=${ENTRY%.runtimeconfig.json}.dll
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
wait_ready
log "Start openresty"
openresty -g 'daemon off;' &
wait -n
log "Exit..."


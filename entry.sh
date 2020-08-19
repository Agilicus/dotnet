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
    until cgi-fcgi -bind -connect 127.0.0.1:9000 |egrep -q "Status: "
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

is_dotnetcore() {
    if [ -n "$DOTNET" ]
    then
      log "DOTNET is is set, force .NET xsp runtime"
      return 1
    fi
    if [ -n "$DOTNETCORE" ]
    then
      log "DOTNETCORE is is set, force dotnetcore runtime"
      return 0
    fi

    if [ -f web.config -o -f Web.config ]
    then
	grep -q aspNetCore [wW]eb.config
        res=$?
        if [ $res -eq 0 ]
        then
	    log "[wW]eb.config exists, is dotnetcore"
            return 0
        fi
        log "[wW]eb.config exists, is not dotnetcore"
        return 1
    fi
    # We should have 1 FOO.runtimeconfig.json
    n_rtc=$(ls *runtimeconfig.json 2>/dev/null | wc -l)
    if [ $n_rtc -eq 0 ]
    then
        log "This is not dotnetcore: no FOO.runtimeconfig.json"
	return 1
    fi
    if [ -n "$ENTRY" -o $n_rtc -eq 1 ]
    then
        log "dotnetcore: ENTRY=\"$ENTRY\" set or runtimeconfig.json exists"
        return 0
    fi
    log "Fall through: assume not dotnetcore"
    return 1
}

do_dotnet() {
    log "Assume .NET runtime"
    log "Start fastcgi"
    mv /rules/server.d/root.conf.xsp /rules/server.d/root.conf
    fastcgi-mono-server4 --applications=/:. --socket=tcp:127.0.0.1:9000 &
    wait_ready
}

do_dotnetcore() {
    log "Assume dotnetcore runtime"
    mv /rules/server.d/root.conf.dnc /rules/server.d/root.conf
    if [ -z "$ENTRY" ]
    then
        n_rtc=$(ls *runtimeconfig.json 2>/dev/null | wc -l)
        if [ $n_rtc -eq 1 ]
        then
	    rtc=$(ls *.runtimeconfig.json)
            ENTRY=${rtc%.runtimeconfig.json}.dll
            log "dotnetcore: chose ENTRY=\"$ENTRY\" via runtimeconfig.json method"
        else
 
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
    fi
    if [ ! -f "$ENTRY" ]
    then
	log "Error: <<$ENTRY>> does not exist in /app directory. In /app these files exist:"
	ls
	exit 1
    fi
    log "Start dotnetcore for <<$ENTRY>>"
    dotnet $ENTRY &
}

is_dotnetcore

if [ $? -eq 0 ]
then
    log "dotnetcore: is_dotnetcore return 0"
    do_dotnetcore
else
    log "not dotnetcore: is_dotnetcore return != 0"
    do_dotnet
fi

log "Start openresty"
openresty -g 'daemon off;' &
wait -n
log "Exit..."

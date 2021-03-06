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
    n=1
    until cgi-fcgi -bind -connect 127.0.0.1:9000 |egrep -q "Status: 200 OK|Status: 404 Not Found|Status: 302 Found"
    do
        log "Wait for fastcgi-mono to be ready"
        sleep 1
        n=$((n+1))
        if [ $n -eq 5 ]
        then
            # Something has (probably) gone wrong, output the full detail error
            log "Error: application has not come online in $n attempts. This likely indicates a problem compiling/uploading it."
            cgi-fcgi -bind -connect 127.0.0.1:9000
        fi
    done
}

export ASPNETCORE_URLS=http://0.0.0.0:9000

log "Startup"
#rm -f /tmp/.X1-lock
#log "Start Xvfb"
#Xvfb :1 &
#log "Update .NET bits (foreground) ..."
#wine /home/dotnet/.wine/drive_c/windows/Microsoft.NET/Framework/v4.0.30319/ngen.exe update /nologo /force ||true
log "Start fastcgi"
if [ -n "$ENTRY" ]
then
    # A hybrid .net + dotnetcore, created as a Kestrel executable.
    cp /rules/server.d/root.dnc /rules/server.d/root.conf
    wine $ENTRY >/dev/null &
else
    wine /home/dotnet/.wine/drive_c/windows/Microsoft.NET/assembly/GAC_32/fastcgi-mono-server4/v4.0_0.4.0.0__0738eb9f132ed756/fastcgi-mono-server4.exe --applications=/:. --socket=tcp:127.0.0.1:9000 &
    wait_ready
fi
log "Start openresty"
openresty -g 'daemon off;' &
wait -n
log "Exit..."

#!/usr/bin/dumb-init /bin/bash
log() {
  >&2 echo "{ \"time\": \"$(date -Is)\", \"log\": \"$*\"}"
}
log "Startup"
rm -f /tmp/.X1-lock
log "Start Xvfb"
Xvfb :1 &
log "Update .NET bits (foreground) ..."
wine /home/dotnet/.wine/drive_c/windows/Microsoft.NET/Framework/v4.0.30319/ngen.exe update /nologo /force ||true
log "Start fastcgi"
wine /home/dotnet/.wine/drive_c/windows/Microsoft.NET/assembly/GAC_32/fastcgi-mono-server4/v4.0_0.4.0.0__0738eb9f132ed756/fastcgi-mono-server4.exe --applications=/:. --socket=tcp:127.0.0.1:9000 &
log "Start nginx"
nginx -g 'daemon off;' &
wait -n
log "Exit..."

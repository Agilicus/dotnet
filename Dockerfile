FROM agilicus/openresty
LABEL maintainer="don@agilicus.com"

WORKDIR /app

# This scary-looking variable only causes apt-key to not warn on the
# output not being stdout (output should not be parsed).
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

RUN apt-get update && \
    apt-get -y install gnupg2 ca-certificates && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee -a /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update && \
    apt-get -y install mono-runtime

RUN apt-get update \
 && apt-get -y install dumb-init libfcgi0ldbl \
 && apt-get update \
 && apt-get install -y mono-xsp4 mono-fastcgi-server4 mono-fpm-server \
 && useradd --create-home -s /bin/bash dotnet \
 && mkdir -p /app \
 && touch /usr/local/openresty/nginx/logs/error.log \
 && chown dotnet:dotnet /app /usr/local/openresty/nginx/logs/error.log \
 && mkdir -p ~/dotnet/.config/"Mono development team" \
 && rm -rf /var/lib/apt/lists/*

COPY fastcgi_params /usr/local/openresty/nginx/conf/fastcgi_params
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY serve.conf /usr/local/openresty/nginx/conf/serve.conf
COPY Index.html /app
COPY entry.sh /

USER dotnet
EXPOSE 5000
ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "/entry.sh" ]


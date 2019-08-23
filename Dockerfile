FROM mono:5-slim
LABEL maintainer="don@agilicus.com"

WORKDIR /app

# This scary-looking variable only causes apt-key to not warn on the
# output not being stdout (output should not be parsed).
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

RUN apt-get update \
 && apt-get -y install curl gnupg2 dumb-init libfcgi0ldbl \
 && curl -L https://nginx.org/keys/nginx_signing.key | apt-key add - \
 && echo "deb http://nginx.org/packages/mainline/debian/ stretch nginx" >> /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y mono-xsp4 mono-fastcgi-server4 mono-fpm-server nginx \
 && useradd --create-home -s /bin/bash dotnet \
 && mkdir -p /app \
 && chown dotnet:dotnet /app \
 && mkdir -p ~/dotnet/.config/"Mono development team" \
 && chown -R dotnet:dotnet /var/log/nginx /var/cache/nginx \
 && rm -rf /var/lib/apt/lists/*

COPY fastcgi_params /etc/nginx/fastcgi_params
COPY nginx.conf /etc/nginx/nginx.conf
COPY Index.html /app
COPY entry.sh /

USER dotnet
EXPOSE 5000
ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "/entry.sh" ]


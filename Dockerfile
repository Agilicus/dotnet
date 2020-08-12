FROM agilicus/openresty:v0.5.16
LABEL maintainer="Agilicus Devs <dev@agilicus.com>"

ENV TZ=Etc/UTC
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# This scary-looking variable only causes apt-key to not warn on the
# output not being stdout (output should not be parsed).
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# Install mono
RUN apt-get update && \
    apt-get -y install gnupg2 ca-certificates && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee -a /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update && \
    apt-get -y install xml2 mono-runtime mono-xsp4 mono-fastcgi-server4 mono-fpm-server

# Install dotnetcore
RUN wget -O /tmp/packages-microsoft-prod.deb -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb && \
    dpkg -i /tmp/packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get -y install gnupg2 ca-certificates dotnet-sdk-3.1 xml2 dumb-init

# Install runtime support etc
RUN apt-get -y install dumb-init libfcgi0ldbl \
 && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
 && echo $TZ > /etc/timezone \
 && useradd --create-home -s /bin/bash dotnet \
 && mkdir -p /app \
 && mkdir -p ~/dotnet/.config/"Mono development team" \
 && rm -rf /var/lib/apt/lists/*

COPY fastcgi_params /usr/local/openresty/nginx/conf/fastcgi_params
COPY rules /rules/
COPY serve-xsp.conf /rules/server.d/root.conf.xsp
COPY serve-dnc.conf /rules/server.d/root.conf.dnc

COPY Index.html /app
COPY entry.sh /

RUN chown -R dotnet:dotnet  /app /rules/server.d

USER dotnet
EXPOSE 5000
ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "/entry.sh" ]


## dotnet{c/m/w}

This container will server an ASP.net application, via openresty
with JSON-logging and embedded WAF.

Place the app in /app.

There are 3 containers built:

- dotnetc --> dotnetcore 3.1 for modern applications
- dotnetm --> .NET on Mono for legacy applications
- dotnetw --> .NET on Mono on Wine for legacy applications that need win32

Each works the same way: [openresty](https://openresty.org/) and [lua-resty-waf](https://github.com/p0pr0ck5/lua-resty-waf)
run on port 5000

## Use (dotnetcore)

Create a Dockerfile for your application as:

```
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app

COPY * /src
WORKDIR /src
RUN dotnet restore

# Copy everything else and build
COPY . /src
RUN dotnet publish -c release -o /app

FROM agilicus/dotnetc
WORKDIR /app
COPY --from=build-env /app /app
```

and then build and test as:

```
tag=$(date +%Y%m%d_%H%M%S)
docker build -t MYNAME:$tag .
docker run --rm -it -p 4200:5000 MYNAME:$tag
```

and then open your browser to `http://localhost:4200`

## Use (.NET)

Create a Dockerfile for your application as:

```
FROM mono:5 AS build-env
WORKDIR /app

COPY ./ /app

RUN nuget restore -PackagesDirectory ../packages

RUN msbuild  /p:Configuration=Release\;WebOutputDir=/tmp/x\;OutDir=/tmp/x MYPROJECT.sln

FROM agilicus/dotnetw
WORKDIR /app
COPY --from=build-env --chown=dotnet /tmp/x/_PublishedWebsites/MYAPP .
```

You may test it with:
```
tag=$(date +%Y%m%d_%H%M%S)
docker build -t MYNAME:$tag .
docker run --rm -it -p 4200:5000 MYNAME:$tag
```

You may override the nginx.conf/lua rules and the app:


```
docker run --rm -it -p 4200:5000 -v $PWD/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf -v $PWD/rules:/rules -v $PWD/app:/app MYNAME:$tag
```

and then open your browser to `http://localhost:5000`

## Environment variables

- HDR_CONTENT_SECURITY_POLICY
- HDR_FEATURE_POLICY

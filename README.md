## dotnet

This container will server an ASP.net application, via nginx,
with JSON-logging.

Place the app in /app.

## Use

Create a Dockerfile for your application as:

```
FROM mono:5 AS build-env
WORKDIR /app

COPY ./ /app

RUN nuget restore -PackagesDirectory ../packages

RUN msbuild  /p:Configuration=Release\;WebOutputDir=/tmp/x\;OutDir=/tmp/x MYPROJECT.sln

FROM agilicus/dotnet

WORKDIR /app
COPY --from=build-env --chown=dotnet /tmp/x/_PublishedWebsites/MYAPP .
```

You may test it with:
`docker build -t MYTAG .`
`docker run --rm -it -p5000:5000 MYTAG`

and then open your browser to `http://localhost:5000`

On the FROM line, you may use `agilicus/dotnet`: small, fast, secure. Or you
may select `agilicus/dotnetw`: compatible.

## Environment variables

- HDR_CONTENT_SECURITY_POLICY
- HDR_FEATURE_POLICY

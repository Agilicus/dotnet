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
COPY --from=build-env /tmp/x/_PublishedWebsites/MYAPP .
```

You may test it with:
`docker build -t MYTAG .`
`docker run --rm -it -p5000:5000 MYTAG`

and then open your browser to `http://localhost:5000`

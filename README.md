# Minimal Package references for F# scripts sample

Build the container

```shell
docker build . -t taktahyl/code-server-net5
```

Spin up the container by running:
```shell
Windows: `run.ps1`
Linux: `run.sh`.
```

This will start up an interactive container with the sample fsharp script.

> docker run -p 8443:8443 -v "/Volumes/ssd/code:/root/code" -v "$(pwd):/app" -w "/app" taktahyl/code-server-net5 

Once inside the container, test by executing the small sample script with:

> dotnet fsi --langversion:preview ./script.fsx

View the downloaded packages in the cache of the container:

> ls -la ~/.nuget/packages/
# AppKu™ Waka
The official AppKu worker docker image. This image contains scripts and tooling used by automated processes and developers working within the AppKu system.

## Getting Started
Pull down the image:
```
docker pull appku/waka
```

Say hello:
```
docker run appku/waka
```

Say hello in the browser:
```
docker run -p 8080:8080 -it appku/waka hello web
```

Run a bash shell on the appku network:
```
docker run -it --network appku appku/waka bash
```
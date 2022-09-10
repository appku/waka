# AppKu™ Waka
The official AppKu worker docker image. This image contains scripts and tooling used by automated processes and
developers working within the AppKu system.

Waka has two distinct tags:
1. The default `:latest` (and `:version`).
   This tag is for automation, testing and development and includes tools and scripts for those purposes.
   When used without a run command, it will execute the default `hello` script.
   All scripts available are:
   - `hello`: Outputs a simple hello message to stdout.
   - `hello web`: Starts and runs a web server on port 8080 with a simple hello message.
2. The :deploy (and `:deploy-version`). 
   This tag is meant for use within AppKu™'s automation platform (*Jido*) to deploy docker-compose based applications
   to AppKu™ hosts.

## Getting Started
Pull down the image:
```
docker pull appku/waka
docker pull appku/waka:deploy
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

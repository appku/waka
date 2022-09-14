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
Pull down the images:
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

Run a bash shell on a local docker appku network:
```
docker run -it --network appku appku/waka bash
```

### Deploying in AppKu™ Jido
To use Waka to deploy a docker-compose project to an AppKu™ host, add the resource type to your pipeline:
```yaml
resource_types:
  - name: appku-deploy
    type: docker-image
    source:
      repository: appku/waka
      tag: deploy
```
Then, add the resource with appropriate configuration values in the source definition.
```yaml
resources:
  - name: appku-deploy
    icon: flash
    type: appku-deploy
    source:
      host: ((host))
      apps: ((host))
      debug: false
      sa:
        username: ((sa.username))
        password: ((sa.password))
        key: ((sa.key))
```
Next, add a `put` step into your job, and instruct the deployment where to find the docker-compose file.
```yaml
jobs:
  - name: put-get
    public: true
    plan:
      # ... 
      # other steps to build and deploy docker images to registry.
      #
      - put: appku-deploy
        params: 
          source: compose
          mode: compose #can be "image" or "compose"
          env: #add your own custom environmental variables.
```

## Development
This project contains multiple docker images that will be built when you execute the `build.sh` script.
You can test these images by running a docker container (see §Getting Started above) based on the image.

### Testing Image `:deploy` Tag
The `:deploy` tag is a special image designed for docker-compose-based deployments to AppKu™ installations
running AppKu™ Jido (based on [Concourse](https://concourse-ci.org/)).

You will find a test pipeline configuration in the `deploy/` directory. You can deploy it to your AppKu™ installation
to test the published `appku/waka` image using the following commands (requires the `fly` CLI tool installed).

Once deployed, you should see a service deployed with a hello website at `https://hello.<your appku FQDN>`.

**Step 1**

Create a `vars.yml` file in `deploy/test/`. Add the keys and values for the variables defined in the
`test-pipeline.yml` file:

```
host: <my appku host> #testing locally this is usually just "localhost".
sa:
  username: <service account name> #this is almost always "appku".
  password: <app service account password> #password defined in AppKu™ Kagi for the service account.
  key: |
    -----BEGIN OPENSSH PRIVATE KEY-----
    ... #the appku account ssh key
    -----END OPENSSH PRIVATE KEY-----
```

**Step 2**
*Note: you may need to include the `--insecure` argument in the `login` command if you are using a self-signed
certificate (this is usually the case if developing locally).
```sh
cd deploy/test/
fly -t test login --team-name main --concourse-url https://jido.<your appku FQDN>
fly validate-pipeline -c waka-hello-pipeline.yml
fly -t test set-pipeline -p waka-hello -c waka-hello-pipeline.yml --check-creds --load-vars-from vars.yml
```


**Step 3**
Verify functionality/tweak and redeploy (Step 2) as needed. When you are done, you can remove the pipeline by using
the following command:

```sh
fly -t test destroy-pipeline -p waka-hello
```

#### Troubleshooting
You can dive into a the running `:deploy` container using the intercept command in `fly`. For example, the following
will intercept the `action-point/deploy` job and prompt you to select the task container.
```sh
fly -t test intercept -j waka-hello/put-get
```
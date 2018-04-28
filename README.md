# ejabberd docker containers

### Build and publish a container

```
docker build --no-cache -t ejabberd:<version> .
docker tag ejabberd mathiasertl/ejabberd:<version>
docker push mathiasertl/ejabberd:<version>
```

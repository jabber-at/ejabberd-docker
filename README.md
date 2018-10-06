# ejabberd docker containers

Docker containers for ejabberd based on the Debian packages provided by jabber.at.

* [Docker repository](https://hub.docker.com/r/mathiasertl/ejabberd/)
* [Debian package](https://github.com/jabber-at/ejabberd)
* More info on packages: [jabber.at/p/apt-repository](https://jabber.at/p/apt-repository/)

### Build and publish a container

```
docker build --no-cache -t ejabberd:<version> .
docker tag ejabberd:<version> mathiasertl/ejabberd:<version>
docker push mathiasertl/ejabberd:<version>
```

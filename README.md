# ejabberd docker containers

Docker containers for ejabberd based on the Debian packages provided by jabber.at.

* [Docker repository](https://hub.docker.com/r/mathiasertl/ejabberd/)
* [Debian package](https://github.com/jabber-at/ejabberd)
* More info on packages: [jabber.at/p/apt-repository](https://jabber.at/p/apt-repository/)

### ChangeLog

#### 18.09-2

* Install all `erlang-p1-*` packages by default.
* Install erlang-redis-client and erlang-luerl.

#### 18.09-1

* Provide a default `inetrc` file in `/etc/inetrc`.
* Modify ejabberdctl so it loads `/etc/inetrc` by default.

### Build and publish a container

```
docker build --no-cache -t ejabberd:<version> .
docker tag ejabberd:<version> mathiasertl/ejabberd:<version>
docker tag ejabberd:<version> mathiasertl/ejabberd:<version>-1
docker push mathiasertl/ejabberd:<version>
docker push mathiasertl/ejabberd:<version>-1
```

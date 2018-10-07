FROM debian:stretch
WORKDIR /var/lib/ejabberd
RUN apt-get update \
    && apt-get install -y gnupg2 wget apt-transport-https patch
RUN echo "deb https://apt.jabber.at stretch ejabberd" > /etc/apt/sources.list.d/jabber.at.list \
    && wget -qO- https://apt.jabber.at/gpg-key | apt-key add -
RUN apt-get update \
    && apt-get install -y ejabberd ejabberd-contrib \
        erlang-p1-mysql erlang-p1-pgsql \
        erlang-p1-sip erlang-p1-stun \
        erlang-p1-oauth2 erlang-p1-pam \
        erlang-redis-client erlang-luerl
RUN mkdir -p /run/ejabberd \
    && chown ejabberd:ejabberd /run/ejabberd /var/lib/ejabberd
ADD files/inetrc /etc/
ADD files/inetrc.patch /tmp/
RUN patch -p1 /usr/sbin/ejabberdctl < /tmp/inetrc.patch && rm /tmp/inetrc.patch

USER ejabberd
EXPOSE 5222 5223 5269 5270 5280
VOLUME ["/var/lib/ejabberd", "/etc/ejabberd", "/var/log/ejabberd"]
CMD ["/usr/sbin/ejabberdctl", "foreground"]

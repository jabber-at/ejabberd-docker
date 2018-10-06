FROM debian:stretch
WORKDIR /var/lib/ejabberd
RUN apt-get update \
    && apt-get install -y gnupg2 wget apt-transport-https
RUN echo "deb https://apt.jabber.at stretch ejabberd" > /etc/apt/sources.list.d/jabber.at.list \
    && wget -qO- https://apt.jabber.at/gpg-key | apt-key add -
RUN apt-get update \
    && apt-get install -y ejabberd erlang-p1-sip ejabberd-contrib
RUN mkdir -p /run/ejabberd \
    && chown ejabberd:ejabberd /run/ejabberd /var/lib/ejabberd
RUN patch -p1 /usr/sbin/ejabberdctl < files/inetrc.patch

USER ejabberd
EXPOSE 5222 5223 5269 5270 5280
VOLUME ["/var/lib/ejabberd", "/etc/ejabberd", "/var/log/ejabberd"]
CMD ["/usr/sbin/ejabberdctl", "foreground"]

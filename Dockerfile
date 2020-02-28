FROM dockette/debian:buster-slim

# DEPS #######################
RUN apt update && apt dist-upgrade -y
RUN apt install -y --no-install-recommends --no-install-suggests wget curl apt-transport-https ca-certificates git gnupg2 cron

# PHP ########################
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ buster main" > /etc/apt/sources.list.d/php.list && \
    apt update && \
    apt install -y --no-install-recommends --no-install-suggests \
        php7.1-apc \
        php7.1-apcu \
        php7.1-bz2 \
        php7.1-bcmath \
        php7.1-calendar \
        php7.1-cgi \
        php7.1-cli \
        php7.1-ctype \
        php7.1-curl \
        php7.1-fpm \
        php7.1-geoip \
        php7.1-gettext \
        php7.1-imap \
        php7.1-ldap \
        php7.1-mbstring \
        php7.1-memcached \
        php7.1-mongo \
        php7.1-mysql \
        php7.1-pdo \
        php7.1-pgsql \
        php7.1-redis \
        php7.1-soap \
        php7.1-sqlite3 \
        php7.1-zip \
        php7.1-xmlrpc \
        php7.1-xsl

# SUPERVISOR #################

RUN apt install -y --no-install-recommends --no-install-suggests supervisor

# NGINX ######################
RUN apt install -y --no-install-recommends --no-install-suggests nginx && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

# PERL #######################
RUN apt install -y --no-install-recommends --no-install-suggests \
    perl \
    libphp-serialization-perl \
    libdbi-perl \
    libgeo-ip-perl \
    libwww-perl \
    libfile-touch-perl \
    libparallel-forkmanager-perl \
    libcache-memcached-perl \
    libdbd-mysql-perl

# TOR ########################
RUN echo "deb https://deb.torproject.org/torproject.org buster main" > /etc/apt/sources.list.d/tor.list && \
    echo "deb-src https://deb.torproject.org/torproject.org buster main" >> /etc/apt/sources.list.d/tor.list && \
    useradd -d /var/lib/tor -s /usr/bin/bash -u 800 torstatus && \
    curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import && \
    gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add - && \
    apt update && \
    apt-get install --no-install-recommends --no-install-suggests -y \
        pwgen \
        iputils-ping \
        tor \
        tor-geoipdb \
        deb.torproject.org-keyring && \
     mkdir -pv /usr/local/etc/tor/ && \
     mv -v /etc/tor/torrc /usr/local/etc/tor/torrc.sample && \
    usermod -l tord debian-tor && \
    groupmod -n tord debian-tor

# DATA #######################

# PHP
ADD ./docker/php/php-fpm.conf /etc/php/7.1/

# NGINX
ADD ./docker/nginx/site.conf /etc/nginx/sites-available/default

# CRON
ADD ./docker/cron /etc/cron.d

# SUPERVISOR
ADD ./docker/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
ADD ./docker/supervisor/services/ /etc/supervisor/conf.d/

# TOR
ADD ./docker/tor/torrc /etc/tor/torrc

# TORSTATUS
ADD ./torstatus /srv/torstatus/

# PORTS ######################

# ORPort, DirPort, SocksPort, ObfsproxyPort, MeekPort
EXPOSE 9001 9030 9050 54444 7002

# VOLUMES ####################
VOLUME /etc/tor /var/lib/tor

WORKDIR /srv/torstatus

CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisor/supervisord.conf"]

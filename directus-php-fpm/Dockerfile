FROM alpine:3.4
MAINTAINER Luis Santos "luis@luissantos.pt"

RUN apk update

RUN adduser -D -H -s /dev/null caddy caddy
RUN adduser -D -H -s /dev/null www-data www-data
RUN mkdir -p /opt/caddy

RUN apk add supervisor
RUN apk add ca-certificates && update-ca-certificates
RUN apk add openssl

RUN apk add php5-fpm
RUN apk add php5-pdo_sqlite php5-pdo_mysql php5-mysqli
RUN apk add php5-mcrypt php5-openssl
RUN apk add php5-gd
RUN apk add php5-opcache php5-apcu php5-memcache
RUN apk add php5-gettext php5-intl php5-iconv
RUN apk add php5-curl php5-json php5-phar

#composer support
RUN apk add php5-ctype php5-dom git
RUN php -r "readfile('https://getcomposer.org/installer');" | php && mv composer.phar /usr/local/bin/composer

#fix missing xml module
RUN apk add php5-pear && sed -i 's/exec $PHP/exec $PHP -d extension=xml.so/g' /usr/bin/pecl

#Install imagemaick using pecl instead of binary version due to binary version incompatibility
RUN apk add imagemagick-dev
RUN apk add php5-dev gcc autoconf g++ openssl-dev make libtool && \
    pecl install mongodb && pecl install imagick && \
    apk del php5-dev gcc autoconf g++ openssl-dev make libtool

RUN wget https://github.com/mholt/caddy/releases/download/v0.9.2/caddy_linux_amd64.tar.gz && \
    echo "72a163dc5a7808085bdc732c0a417b3eb7861938  caddy_linux_amd64.tar.gz" | sha1sum -c - && tar -xf caddy_linux_amd64.tar.gz -C /opt/caddy && \
    rm caddy_linux_amd64.tar.gz

ADD etc /etc
ADD usr /usr

RUN mkdir -p /var/log/supervisor/
RUN touch /var/log/php-fpm.log && chown www-data.www-data /var/log/php-fpm.log
RUN mkdir /var/run/php && chown www-data.www-data /var/run/php/
RUN touch /var/log/caddy.log && chown caddy.caddy /var/log/caddy.log

RUN rm -R /tmp/*

ENTRYPOINT ["/usr/bin/supervisord"]

CMD ["-c", "/etc/supervisord.conf", "--nodaemon"]

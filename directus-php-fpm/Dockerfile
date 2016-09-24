FROM alpine:3.4
MAINTAINER Luis Santos "luis@luissantos.pt"

RUN apk update
RUN apk add php5-fpm
RUN apk add supervisor
RUN apk add ca-certificates
RUN update-ca-certificates
RUN apk add openssl
RUN apk add php5-pdo_sqlite php5-pdo_mysql php5-mysqli
RUN apk add php5-mcrypt
RUN apk add php5-iconv
RUN apk add php5-gd
#RUN apk add php5-gd php5-imagick
RUN apk add php5-opcache php5-apcu
RUN apk add php5-memcache
RUN apk add php5-gettext php5-intl
RUN apk add php5-curl php5-json
RUN apk add php5-openssl
RUN apk add php5-phar
RUN php -r "readfile('https://getcomposer.org/installer');" | php && mv composer.phar /usr/local/bin/composer

RUN adduser -D -H -s /bin/sh caddy caddy
RUN adduser -D -H -s /dev/null www-data www-data
RUN mkdir -p /opt/caddy

RUN wget https://github.com/mholt/caddy/releases/download/v0.9.2/caddy_linux_amd64.tar.gz
RUN echo "72a163dc5a7808085bdc732c0a417b3eb7861938  caddy_linux_amd64.tar.gz" | sha1sum -c - && tar -xf caddy_linux_amd64.tar.gz -C /opt/caddy
RUN rm caddy_linux_amd64.tar.gz

RUN apk add php5-pear
#fix missing xml module
RUN sed -i 's/exec $PHP/exec $PHP -d extension=xml.so/g' /usr/bin/pecl
RUN apk add vim
RUN apk add php5-dev gcc autoconf
RUN apk add g++
RUN apk add openssl-dev
RUN apk add make

RUN pecl install mongodb

#Install imagemaick using pecl instead of binary version due to binary version incompatibility
RUN apk add imagemagick-dev libtool
RUN pecl install imagick


ADD etc /etc

RUN mkdir -p /var/log/supervisor/
RUN touch /var/log/php-fpm.log && chown www-data.www-data /var/log/php-fpm.log
RUN mkdir /var/run/php && chown www-data.www-data /var/run/php/
RUN touch /var/log/caddy.log && chown caddy.caddy /var/log/caddy.log


RUN rm -R /tmp/*

ENTRYPOINT ["/usr/bin/supervisord"]

CMD ["-c", "/etc/supervisord.conf", "--nodaemon"]

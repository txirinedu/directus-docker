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

ADD etc /etc

RUN mkdir -p /var/log/supervisor/

ENTRYPOINT ["/usr/bin/supervisord"]

CMD ["-c", "/etc/supervisord.conf", "--nodaemon"]

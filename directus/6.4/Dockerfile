FROM getdirectus/directus-base-layer:v0.0.6
MAINTAINER Kristian Frolund "https://github.com/Froelund"

RUN get-directus version\/6.4
RUN composer install -o -d /var/www/html/
RUN fix-directus-permissions

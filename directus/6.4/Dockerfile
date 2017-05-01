FROM getdirectus/directus-base-layer:0.0.7
MAINTAINER Kristian Frolund "https://github.com/Froelund"

RUN get-directus 6.4.0-beta.2
RUN composer install -o -d /var/www/html/
RUN fix-directus-permissions

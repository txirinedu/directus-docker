FROM getdirectus/directus-base-layer:v0.0.6
MAINTAINER Luis Santos "luis@luissantos.pt"

RUN get-directus 6.3.6
RUN composer install -o -d /var/www/html/
RUN fix-directus-permissions

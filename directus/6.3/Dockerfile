FROM getdirectus/directus-base-layer:0.0.7
MAINTAINER Luis Santos "luis@luissantos.pt"

RUN get-directus 6.3.7
RUN composer install -o -d /var/www/html/
RUN fix-directus-permissions

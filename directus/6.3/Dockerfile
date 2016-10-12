FROM getdirectus/directus-base-layer:v0.0.4
MAINTAINER Luis Santos "luis@luissantos.pt"


RUN get-directus 6.3.4
RUN composer install -o -d /var/www/directus/
RUN fix-directus-permissions

FROM directus/directus-base-image:0.1
MAINTAINER Luis Santos "luis@luissantos.pt"


RUN get-directus 6.3.3
RUN composer install -o -d /var/www/directus/
RUN fix-directus-permissions

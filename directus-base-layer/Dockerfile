FROM php:7-apache
MAINTAINER Kristian Frolund "https://github.com/Froelund"

RUN apt-get update && apt-get install -y \
  wget \
  git \
  zip \
  unzip \
  vim \
  mysql-client

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev

RUN apt-get install -y --no-install-recommends libmagickwand-dev && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install -j$(nproc) mcrypt pdo_mysql mysqli && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd

RUN pecl install imagick

RUN a2enmod rewrite

ADD usr /usr
ADD etc /etc
RUN chown www-data:www-data /var/www

CMD ["run-directus"]

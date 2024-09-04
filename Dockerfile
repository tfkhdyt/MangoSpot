FROM php:apache-bookworm

WORKDIR /var/www/html/mangospot

COPY . .

RUN a2enmod rewrite

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apt update && apt install -y libmcrypt-dev libssh2-1-dev libzip-dev libpng-dev libxslt-dev
RUN install-php-extensions gd xsl

RUN pecl install mcrypt-1.0.7 ssh2-1.4.1 zip-1.22.3

RUN docker-php-ext-install pdo pdo_mysql gd xsl
RUN docker-php-ext-enable mcrypt ssh2 zip
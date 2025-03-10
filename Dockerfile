FROM php:8.0.0rc1-fpm

RUN apt-get update

RUN docker-php-ext-install pdo_mysql

WORKDIR /var/www

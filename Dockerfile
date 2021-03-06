FROM php:5.6-fpm
RUN pecl install xdebug-2.5.3 \
    && docker-php-ext-enable xdebug
    
RUN docker-php-ext-install mysql mysqli pdo pdo_mysql

COPY 99-xdebug.ini /usr/local/etc/php/conf.d/

RUN apt update && apt install -y openssh-server supervisor

EXPOSE 80 443 22

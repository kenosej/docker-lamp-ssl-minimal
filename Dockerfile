FROM php:7.3-apache

ARG DEBIAN_FRONTEND=noninteractive

# Update
RUN apt-get -y update --fix-missing && \
    apt-get upgrade -y && \
    apt-get --no-install-recommends install -y apt-utils && \
    rm -rf /var/lib/apt/lists/*


# Install redis
RUN pecl install redis-5.0.2 && \
    docker-php-ext-enable redis


# Other PHP7 Extensions

RUN docker-php-ext-install pdo_mysql

RUN apt-get update && apt-get install -y libpng-dev 

RUN apt-get install -y \
    libjpeg62-turbo-dev \
    libpng-dev \
    libfreetype6-dev

RUN docker-php-ext-configure gd \
    --with-gd \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib-dir \
    --with-freetype-dir

RUN docker-php-ext-install gd


RUN apt-get install -y libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl


# Enable apache modules
RUN a2enmod rewrite headers
RUN a2enmod ssl


# Cleanup
RUN rm -rf /usr/src/*


COPY localhost.crt /etc/apache2/ssl/ssl.crt
COPY localhost.key /etc/apache2/ssl/ssl.key

WORKDIR /var/www/html

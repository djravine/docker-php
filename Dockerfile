FROM php:7.1

LABEL maintainer="Adan Rehtla <adan@adanrehtla.com>"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
        gifsicle \
        jpegoptim \
        libpng-dev \
        libjpeg62-turbo-dev \
        libfreetype6-dev \
        locales \
        libzip-dev \
        mariadb-client \
        optipng \
        unzip \
        pgpgpg \
        pngquant \
        procps \
        libtidy-dev \
        nodejs \
        libxtst6 \
        libnss3 \
        libnspr4 \
        libxss1 \
        libasound2 \
        libatk-bridge2.0-0 \
        libgtk-3-0 \
        libgdk-pixbuf2.0-0 \
        libgbm-dev \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

# Laravel Server Requirements: https://laravel.com/docs/7.x#server-requirements
# https://github.com/docker-library/php/issues/912
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-configure zip
RUN docker-php-ext-install \
        bcmath \
        exif \
        gd \
        pcntl \
	pdo \
        pdo_mysql \
        zip \
        tidy

RUN pecl install xdebug \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_host = host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-enable tidy \
    && docker-php-ext-enable exif

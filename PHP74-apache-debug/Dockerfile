FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
    apt-utils \
    libcurl4-gnutls-dev \
    libmemcached-dev \
    libz-dev \
    libpq-dev \
    libfreetype6-dev \
    libssl-dev \
    libbz2-dev \
    libxml2-dev \
    libpng-dev \
    libjpeg-dev \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libicu-dev \
    libzip-dev \
    libzstd-dev \
    libxpm-dev \
    libfreetype6-dev \
    libxslt-dev \
    wget \
    unzip \
    vim \
    nano \
    sudo \
    supervisor \
    pwgen \
    redis-tools \
    git \
    iproute2 \
    imagemagick \
    libmagickwand-dev \
    libimage-exiftool-perl \
    poppler-utils \
    html2text \
    gnupg \
    graphviz \
    nodejs \
    npm \
    libonig-dev \
    mariadb-client-10.3

RUN docker-php-ext-install \
    mbstring \
    iconv \
    curl \
    dom \
    exif \
    fileinfo \
    curl \
    mysqli \
    pdo \
    zip \
    pdo_mysql \
    bz2 \
    opcache \
    intl \
    ftp \
    bcmath \
    sockets \
    intl \
    simplexml \
    soap \
    xsl

RUN yes | pecl install igbinary && docker-php-ext-enable igbinary
RUN yes | pecl install xdebug && docker-php-ext-enable xdebug
RUN yes | pecl install apcu && docker-php-ext-enable apcu
RUN yes | pecl install redis && docker-php-ext-enable redis
RUN yes | pecl install imagick && docker-php-ext-enable imagick

RUN docker-php-ext-install gd && \
    docker-php-ext-configure gd --with-freetype --with-webp --with-jpeg \
	&& docker-php-ext-install -j$(nproc) gd

RUN mv /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini /usr/local/etc/php/docker-php-ext-xdebug.ini.disabled

RUN a2enmod rewrite actions alias status filter expires headers setenvif socache_shmcb ssl

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_MEMORY_LIMIT -1
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN set -eux; \
    composer global require "hirak/prestissimo:^0.3" --prefer-dist --no-progress --no-suggest --classmap-authoritative; \
    composer clear-cache
ENV PATH="${PATH}:/root/.composer/vendor/bin"

RUN echo "umask 000" >> /root/.bashrc && usermod -a -G root www-data && chsh www-data -s /bin/bash

COPY /etc/000-default.conf /etc/apache2/sites-enabled/
COPY /etc/default-ssl.conf /etc/apache2/sites-enabled/
COPY /etc/ssl.crt /etc/ssl/crt/
COPY /etc/ssl.key /etc/ssl/crt/

COPY /etc/xon /usr/local/bin/xon
COPY /etc/xoff /usr/local/bin/xoff
COPY /etc/custom.php.ini /usr/local/etc/php/conf.d/custom.php.ini

RUN a2disconf javascript-common

WORKDIR "/var/www"

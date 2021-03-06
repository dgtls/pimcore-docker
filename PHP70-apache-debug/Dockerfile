FROM php:7.0-apache

RUN apt-get update && apt-get install -y \
    apt-utils \
    libcurl4-gnutls-dev \
    libbz2-dev \
    libxml2-dev \
    libpng-dev \
    libjpeg-dev \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libicu-dev \
    libzip-dev \
    libzstd-dev \
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
    nodejs

RUN docker-php-ext-install \
    mbstring \
    iconv \
    curl \
    dom \
    exif \
    fileinfo \
    curl \
    gd \
    mysqli \
    pdo \
    zip \
    pdo_mysql \
    bz2 \
    opcache \
    intl \
    bcmath \
    sockets \
    intl \
    simplexml \
    soap \
    xsl

RUN yes | pecl install igbinary && docker-php-ext-enable igbinary
RUN yes | pecl install apcu && docker-php-ext-enable apcu
RUN yes | pecl install imagick && docker-php-ext-enable imagick

RUN docker-php-ext-install gd && \
    docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir \
        --with-png-dir --with-zlib-dir --with-freetype-dir && \
    docker-php-ext-install gd

RUN a2enmod rewrite actions alias status filter expires headers setenvif socache_shmcb ssl

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_MEMORY_LIMIT -1
COPY --from=composer:1 /usr/bin/composer /usr/local/bin/composer

RUN set -eux; \
    composer global require "hirak/prestissimo:^0.3" --prefer-dist --no-progress --no-suggest --classmap-authoritative; \
    composer clear-cache
ENV PATH="${PATH}:/root/.composer/vendor/bin"

RUN echo "umask 000" >> /root/.bashrc && usermod -a -G root www-data && chsh www-data -s /bin/bash

COPY /etc/000-default.conf /etc/apache2/sites-enabled/
COPY /etc/default-ssl.conf /etc/apache2/sites-enabled/
COPY /etc/ssl.crt /etc/ssl/crt/
COPY /etc/ssl.key /etc/ssl/crt/

COPY /etc/custom.php.ini /usr/local/etc/php/conf.d/custom.php.ini

WORKDIR "/var/www"

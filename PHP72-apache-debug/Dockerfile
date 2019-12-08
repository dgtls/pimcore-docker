FROM php:7.2-apache

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
    wget \
    unzip \
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
    npm

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
    simplexml

RUN yes | pecl install igbinary && docker-php-ext-enable igbinary
RUN yes | pecl install xdebug && docker-php-ext-enable xdebug
RUN yes | pecl install apcu && docker-php-ext-enable apcu
RUN yes | pecl install redis && docker-php-ext-enable redis
RUN yes | pecl install imagick && docker-php-ext-enable imagick

RUN docker-php-ext-install gd && \
    docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir \
        --with-png-dir --with-zlib-dir --with-freetype-dir && \
    docker-php-ext-install gd

RUN a2enmod rewrite actions alias status filter expires headers setenvif socache_shmcb ssl

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php --install-dir=/usr/local/bin && php -r "unlink('composer-setup.php');" \
    && mv /usr/local/bin/composer.phar /usr/local/bin/composer

RUN echo "umask 000" >> /root/.bashrc && usermod -a -G root www-data && chsh www-data -s /bin/bash

COPY /etc/000-default.conf /etc/apache2/sites-enabled/
COPY /etc/default-ssl.conf /etc/apache2/sites-enabled/
COPY /etc/ssl.crt /etc/ssl/crt/
COPY /etc/ssl.key /etc/ssl/crt/

COPY /etc/xdebug.sh /usr/local/bin/xdebug.sh
COPY /etc/custom.php.ini /usr/local/etc/php/conf.d/custom.php.ini

WORKDIR "/var/www"

FROM php:7.3-fpm
RUN apt-get update && apt-get install -y sendmail \
        git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
		libmagickwand-dev \
    && docker-php-ext-install -j$(nproc) mysqli pdo opcache pdo_mysql iconv mcrypt zip pcntl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd bcmath exif \
    && docker-php-ext-enable gd mysqli pdo opcache pdo_mysql iconv mcrypt zip pcntl \
	&& pecl install -o -f redis imagick \
	&& rm -rf /tmp/pear \
	&& docker-php-ext-enable redis imagick \

FROM php:7.4-fpm
RUN apt-get update && apt-get install -y --no-install-recommends \ 
	sendmail git libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libmagickwand-dev libzip-dev zip \
	&& rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-configure gd --with-png=/usr/include/ --with-freetype=/usr/include/ --with-jpeg=/usr/include/
RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install -j$(nproc) gd mysqli pdo opcache pdo_mysql iconv zip pcntl bcmath exif 
RUN docker-php-ext-enable opcache
RUN pecl install -o -f redis imagick mcrypt && rm -rf /tmp/pear && docker-php-ext-enable redis imagick mcrypt

RUN apt-get install -y memcached
RUN apt-get install -y libmemcached-dev zlib1g-dev libicu-dev
RUN git clone -b php7 https://github.com/php-memcached-dev/php-memcached 
/usr/src/php/ext/memcached \
&& docker-php-ext-configure /usr/src/php/ext/memcached \
    --disable-memcached-sasl \
&& docker-php-ext-install /usr/src/php/ext/memcached \
&& rm -rf /usr/src/php/ext/memcached

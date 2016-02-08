FROM php:5.6-apache
RUN echo "UTC" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        zlib1g-dev \
        git \
    && docker-php-ext-install -j$(nproc) iconv mcrypt zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

ADD php.ini $PHP_INI_DIR/conf.d/php.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && /usr/local/bin/composer --repository-url="https://raw.githubusercontent.com/dru-id/druid-php-skel/master" --dev create-project druid/php-skel /druid \
    && sed -i -- 's/Directory \/var\/www\//Directory \/druid\/src\/main\/php\//g' /etc/apache2/apache2.conf && sed -i -- 's/\/var\/www\/html/\/druid\/src\/main\/php\/webapp/g' /etc/apache2/apache2.conf

#WORKDIR /druid/src/main/php

VOLUME /druid


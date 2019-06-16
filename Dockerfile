FROM akilli/base

LABEL maintainer="Ayhan Akilli"

#
# Setup
#
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/main -X http://dl-cdn.alpinelinux.org/alpine/edge/community \
        php7 \
        php7-ctype \
        php7-curl \
        php7-dom \
        php7-fileinfo \
        php7-fpm \
        php7-gd \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-ldap \
        php7-mbstring \
        php7-mysqlnd \
        php7-opcache \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-pgsql \
        php7-session \
        php7-simplexml \
        php7-soap \
        php7-sqlite3 \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-xsl \
        php7-zip && \
    rm -rf /etc/php7/php-fpm.d && \
    ln -s php-fpm7 /usr/sbin/php-fpm

COPY php.ini /etc/php7/conf.d/90-php.ini
COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY s6/ /etc/s6/php/

#
# Ports
#
EXPOSE 9000

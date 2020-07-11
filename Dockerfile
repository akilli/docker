FROM akilli/base
LABEL maintainer="Ayhan Akilli"

RUN apk add --no-cache \
        php7 \
        php7-bz2 \
        php7-ctype \
        php7-curl \
        php7-dom \
        php7-fileinfo \
        php7-fpm \
        php7-ftp \
        php7-gd \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-ldap \
        php7-mbstring \
        php7-mysqlnd \
        php7-opcache \
        php7-openssl \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-pgsql \
        php7-phar \
        php7-posix \
        php7-session \
        php7-simplexml \
        php7-soap \
        php7-sockets \
        php7-sodium \
        php7-sqlite3 \
        php7-tokenizer \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-xsl \
        php7-zip && \
    ln -s php7 /etc/php && \
    ln -s php-fpm7 /usr/sbin/php-fpm && \
    rm -f \
        /etc/php/php-fpm.d/www.conf \
        /etc/php/php-fpm.conf && \
    app-user && \
    app-chown
COPY etc/conf.d/php.ini /etc/php/conf.d/99_php.ini
COPY etc/php-fpm.d/ /etc/php/php-fpm.d/
COPY etc/php-fpm.conf /etc/php/php-fpm.conf
COPY s6/ /s6/php/

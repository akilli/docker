FROM akilli/base
LABEL maintainer="Ayhan Akilli"

ENV DEV=0

RUN apk add --no-cache \
        php8 \
        php8-bz2 \
        php8-ctype \
        php8-curl \
        php8-dom \
        php8-fileinfo \
        php8-fpm \
        php8-ftp \
        php8-gd \
        php8-iconv \
        php8-intl \
        php8-json \
        php8-ldap \
        php8-mbstring \
        php8-mysqlnd \
        php8-opcache \
        php8-openssl \
        php8-pdo \
        php8-pdo_mysql \
        php8-pdo_pgsql \
        php8-pdo_sqlite \
        php8-pgsql \
        php8-phar \
        php8-posix \
        php8-session \
        php8-simplexml \
        php8-soap \
        php8-sockets \
        php8-sodium \
        php8-sqlite3 \
        php8-tokenizer \
        php8-xml \
        php8-xmlreader \
        php8-xmlwriter \
        php8-xsl \
        php8-zip && \
    ln -s php8 /etc/php && \
    ln -s php8 /usr/bin/php && \
    ln -s php-fpm8 /usr/sbin/php-fpm && \
    rm -f \
        /etc/php/php-fpm.d/www.conf \
        /etc/php/php-fpm.conf && \
    app-user && \
    app-chown
COPY etc/ /etc/php/
COPY init/ /init/

CMD ["php-fpm"]

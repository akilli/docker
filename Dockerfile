FROM akilli/base
LABEL maintainer="Ayhan Akilli"

ENV DEV=0

RUN apk add --no-cache \
        icu-data-full \
        php81 \
        php81-bz2 \
        php81-ctype \
        php81-curl \
        php81-dom \
        php81-fileinfo \
        php81-fpm \
        php81-ftp \
        php81-gd \
        php81-iconv \
        php81-intl \
        php81-json \
        php81-ldap \
        php81-mbstring \
        php81-mysqlnd \
        php81-opcache \
        php81-openssl \
        php81-pdo \
        php81-pdo_mysql \
        php81-pdo_pgsql \
        php81-pdo_sqlite \
        php81-pgsql \
        php81-phar \
        php81-posix \
        php81-session \
        php81-simplexml \
        php81-soap \
        php81-sockets \
        php81-sodium \
        php81-sqlite3 \
        php81-tokenizer \
        php81-xml \
        php81-xmlreader \
        php81-xmlwriter \
        php81-xsl \
        php81-zip && \
    ln -s php81 /etc/php && \
    ln -s php81 /usr/bin/php && \
    ln -s php-fpm81 /usr/sbin/php-fpm && \
    rm -f \
        /etc/php/php-fpm.d/www.conf \
        /etc/php/php-fpm.conf && \
    app-user && \
    app-chown
COPY etc/ /etc/php/
COPY init/ /init/

CMD ["php-fpm"]

FROM akilli/base
LABEL maintainer="Ayhan Akilli"

ENV DEV=0

RUN apk add --no-cache \
        icu-data-full \
        php82 \
        php82-bz2 \
        php82-ctype \
        php82-curl \
        php82-dom \
        php82-fileinfo \
        php82-fpm \
        php82-ftp \
        php82-gd \
        php82-iconv \
        php82-intl \
        php82-json \
        php82-ldap \
        php82-mbstring \
        php82-mysqlnd \
        php82-opcache \
        php82-openssl \
        php82-pdo \
        php82-pdo_mysql \
        php82-pdo_pgsql \
        php82-pdo_sqlite \
        php82-pgsql \
        php82-phar \
        php82-posix \
        php82-session \
        php82-simplexml \
        php82-soap \
        php82-sockets \
        php82-sodium \
        php82-sqlite3 \
        php82-tokenizer \
        php82-xml \
        php82-xmlreader \
        php82-xmlwriter \
        php82-xsl \
        php82-zip && \
    ln -s php82 /etc/php && \
    (which php || ln -s php82 /usr/bin/php) && \
    ln -s php-fpm82 /usr/sbin/php-fpm && \
    rm -f \
        /etc/php/php-fpm.d/www.conf \
        /etc/php/php-fpm.conf && \
    app-user && \
    app-chown
COPY etc/ /etc/php/
COPY init/ /init/

CMD ["php-fpm"]

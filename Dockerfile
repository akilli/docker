FROM akilli/base

LABEL maintainer="Ayhan Akilli"

ARG CFLAGS="-fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
ARG CPPFLAGS="$CFLAGS"
ARG LDFLAGS="-Wl,-O1 -Wl,--hash-style=both -pie"

ENV PHP_INI_DIR=/etc/php
ENV PHP_VERSION=7.4.1

RUN apk add --no-cache \
        argon2-libs \
        curl \
        freetype \
        icu-libs \
        libbz2 \
        libedit \
        libjpeg-turbo \
        libldap \
        libpng \
        libpq \
        libsodium \
        libwebp \
        libxml2 \
        libxslt \
        libzip \
        oniguruma \
        openssl \
        sqlite-libs \
        tar \
        xz && \
    # phpize
    apk add --no-cache --virtual .phpize-deps \
        autoconf \
        build-base \
        dpkg \
        dpkg-dev \
        re2c && \
    # build
    apk add --no-cache --virtual .build-deps \
        argon2-dev \
        bzip2-dev \
        coreutils \
        curl-dev \
        freetype-dev \
        icu-dev \
        libedit-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libsodium-dev \
        libxml2-dev \
        libxslt-dev \
        libzip-dev \
        libwebp-dev \
        linux-headers \
        oniguruma-dev \
        openldap-dev \
        openssl-dev \
        postgresql-dev \
        sqlite-dev && \
    cd /tmp && \
    wget -O php.tar.xz https://www.php.net/get/php-${PHP_VERSION}.tar.xz/from/this/mirror && \
    mkdir -p \
        $PHP_INI_DIR/conf.d \
        /tmp/php && \
    tar -Jxf php.tar.xz -C /tmp/php --strip-components=1 && \
    cd /tmp/php && \
    ./configure \
        --disable-cgi \
        --enable-fpm \
        --enable-ftp \
        --enable-gd \
        --enable-intl \
        --enable-opcache \
        --enable-option-checking=fatal \
        --enable-mbstring \
        --enable-mysqlnd \
        --enable-soap \
        --prefix=/usr \
        --sysconfdir="$PHP_INI_DIR" \
        --with-bz2 \
        --with-config-file-path="$PHP_INI_DIR" \
        --with-config-file-scan-dir="$PHP_INI_DIR/conf.d" \
        --with-curl \
        --with-freetype \
        --with-jpeg \
        --with-ldap \
        --with-ldap-sasl \
        --with-libedit \
        --with-openssl \
        --with-password-argon2 \
        --with-pdo-mysql \
        --with-pdo-pgsql \
        --with-pdo-sqlite \
        --with-pgsql \
        --with-sodium=shared \
        --with-sqlite3 \
        --with-xsl \
        --with-webp \
        --with-zip \
        --with-zlib && \
    make -j "$(nproc)" && \
    find -type f -name '*.a' -delete && \
    make install && \
    find /usr/bin /usr/sbin -type f -name 'php*' -perm +0111 -exec strip --strip-all '{}' + || true && \
    make clean && \
    mv php.ini-production $PHP_INI_DIR/php.ini && \
    rm -rf \
        $PHP_INI_DIR/php-fpm.d/www.conf.default \
        $PHP_INI_DIR/php-fpm.conf.default \
        /tmp/* && \
    apk del \
        .build-deps \
        .phpize-deps

COPY etc/ /etc/php/
COPY s6/ /s6/php/

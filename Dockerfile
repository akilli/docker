FROM akilli/base
LABEL maintainer="Ayhan Akilli"

ARG DEBIAN_FRONTEND=noninteractive
ARG KEY=14AA40EC0831756756D7F66C4F4EA0AAE5267A6C

RUN app-install gnupg2 && \
    echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu focal main" > /etc/apt/sources.list.d/php.list && \
    apt-key --keyring /etc/apt/trusted.gpg.d/php.gpg adv --recv-keys --keyserver keyserver.ubuntu.com $KEY && \
    app-remove gnupg2 && \
    app-install \
        php7.4 \
        php7.4-bz2 \
        php7.4-cli \
        php7.4-common \
        php7.4-curl \
        php7.4-fpm \
        php7.4-gd \
        php7.4-intl \
        php7.4-json \
        php7.4-ldap \
        php7.4-mbstring \
        php7.4-mysql \
        php7.4-pgsql \
        php7.4-opcache \
        php7.4-soap \
        php7.4-sqlite3 \
        php7.4-xml \
        php7.4-xsl \
        php7.4-zip && \
    rm -f \
        /etc/php/7.4/fpm/php-fpm.conf \
        /etc/php/7.4/fpm/pool.d/www.conf && \
    ln -s ../../mods-available/php.ini /etc/php/7.4/cli/conf.d/90-php.ini && \
    ln -s ../../mods-available/php.ini /etc/php/7.4/fpm/conf.d/90-php.ini && \
    app-clean
COPY php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY php.ini /etc/php/7.4/mods-available/php.ini

CMD ["php-fpm7.4"]

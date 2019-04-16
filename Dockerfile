FROM alpine

LABEL maintainer="Ayhan Akilli"

#
# Build variables
#
ARG ID=1000
ARG LANG=de_DE.UTF-8
ARG TZ=Europe/Berlin

#
# Environment variables
#
ENV LANG=$LANG \
    MUSL_LOCPATH="/usr/share/i18n/locales/musl"

#
# Setup
#
COPY rootfs/ /

RUN addgroup -g $ID app && \
    adduser -u $ID -G app -s /bin/ash -D app && \
    mkdir \
        /app \
        /data && \
    apk add --no-cache \
        libintl \
        s6 \
        su-exec && \
    apk add --no-cache --virtual .deps \
        cmake \
        gcc \
        gettext-dev \
        git \
        make \
        musl-dev \
        tzdata && \
    git clone https://gitlab.com/rilian-la-te/musl-locales /tmp/musl-locales && \
    cd /tmp/musl-locales && \
    cmake -DLOCALE_PROFILE=OFF -DCMAKE_INSTALL_PREFIX:PATH=/usr . && \
    make && \
    make install && \
    cd / && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    rm -rf \
        /etc/TZ \
        /tmp/musl-locales && \
    apk del \
        .deps

#
# Command
#
ENTRYPOINT ["app-entry"]
CMD []

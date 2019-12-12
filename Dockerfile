FROM alpine:edge

LABEL maintainer="Ayhan Akilli"

ARG ID=1000
ARG LANG=de_DE.UTF-8
ARG TZ=Europe/Berlin

ENV LANG=$LANG
ENV MUSL_LOCPATH=/usr/share/i18n/locales/musl

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
    echo "$TZ" > /etc/timezone && \
    rm -rf \
        /etc/TZ \
        /tmp/musl-locales && \
    apk del \
        .deps

COPY rootfs/ /

ENTRYPOINT ["app-entry"]

CMD []

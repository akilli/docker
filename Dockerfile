FROM alpine:edge

LABEL maintainer="Ayhan Akilli"

ARG LANG=de_DE.UTF-8
ARG TZ=Europe/Berlin

ENV LANG=$LANG
ENV MUSL_LOCPATH=/usr/share/i18n/locales/musl

RUN apk add --no-cache \
        ca-certificates \
        s6 \
        su-exec && \
    mkdir -p \
        /init \
        /s6 && \
    # timezone
    apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    rm -rf /etc/TZ && \
    apk del tzdata && \
    # locales
    apk add --no-cache libintl && \
    apk add --no-cache --virtual .locale-deps \
        cmake \
        gcc \
        gettext-dev \
        git \
        make \
        musl-dev && \
    git clone https://gitlab.com/rilian-la-te/musl-locales /tmp/musl-locales && \
    cd /tmp/musl-locales && \
    cmake -DLOCALE_PROFILE=OFF -DCMAKE_INSTALL_PREFIX:PATH=/usr . && \
    make && \
    make install && \
    rm -rf /tmp/musl-locales && \
    apk del .locale-deps

COPY etc/ /etc/
COPY s6/ /s6/
COPY app-entry /usr/local/bin/app-entry

ENTRYPOINT ["app-entry"]

CMD []

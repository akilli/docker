########################################################################################################################
# Build Image
########################################################################################################################
FROM alpine AS builder

#
# Build variables
#
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

RUN mkdir \
        /app \
        /data \
        /home/app && \
    apk add --no-cache \
        bash \
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
        /etc/group- \
        /etc/passwd- \
        /etc/shadow- \
        /tmp/musl-locales && \
    apk del \
        .deps

########################################################################################################################
# Base Image
########################################################################################################################
FROM scratch

LABEL maintainer="Ayhan Akilli"

#
# Build variables
#
ARG LANG=de_DE.UTF-8

#
# Environment variables
#
ENV LANG=$LANG

#
# Setup
#
COPY --from=builder / /

#
# Command
#
ENTRYPOINT ["app-entry"]
CMD []

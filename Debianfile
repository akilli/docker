########################################################################################################################
# Build Image
########################################################################################################################
FROM debian:buster-slim AS builder

#
# Build variables
#
ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=de_DE.UTF-8
ARG TZ=Europe/Berlin

#
# Setup
#
COPY rootfs/ /

RUN mkdir \
        /app \
        /data \
        /home/app && \
    apt-get -y update && \
    apt-get -y --no-install-recommends install \
        locales \
        s6 && \
    localedef -i de_DE -c -f UTF-8 -A /usr/share/locale/locale.alias de_DE.UTF-8 && \
    unlink /etc/localtime && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get -y remove \
        tzdata && \
    apt-get -y --purge autoremove && \
    apt-get -y clean && \
    rm -rf \
        /etc/group- \
        /etc/passwd- \
        /etc/shadow- \
        /var/lib/apt/lists/*

########################################################################################################################
# Base Image
########################################################################################################################
FROM scratch

LABEL maintainer="Ayhan Akilli"

#
# Environment variables
#
ENV LANG=de_DE.UTF-8

#
# Setup
#
COPY --from=builder / /

#
# Command
#
ENTRYPOINT ["app-entry"]
CMD []

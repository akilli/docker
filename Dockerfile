########################################################################################################################
# Build Image
########################################################################################################################
FROM alpine AS builder

#
# Build variables
#
ARG BASE=de_DE
ARG GLIBC=2.29
ARG TZ=Europe/Berlin

#
# Environment variables
#
ENV LANG=$BASE.UTF-8

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
        s6 \
        su-exec && \
    apk add --no-cache --virtual .deps \
        ca-certificates \
        tzdata \
        wget && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC-r0/glibc-$GLIBC-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC-r0/glibc-bin-$GLIBC-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC-r0/glibc-i18n-$GLIBC-r0.apk && \
    apk add --no-cache \
        glibc-bin-$GLIBC-r0.apk \
        glibc-i18n-$GLIBC-r0.apk \
        glibc-$GLIBC-r0.apk && \
    /usr/glibc-compat/bin/localedef -i $BASE -f UTF-8 $LANG && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    rm -rf \
        /etc/TZ \
        /etc/group- \
        /etc/passwd- \
        /etc/shadow- && \
    apk del \
        .deps

########################################################################################################################
# Base Image
########################################################################################################################
FROM scratch

LABEL maintainer="Ayhan Akilli"

#
# Environment variables
#
ENV LANG=$BASE.UTF-8

#
# Setup
#
COPY --from=builder / /

#
# Command
#
ENTRYPOINT ["app-entry"]
CMD []

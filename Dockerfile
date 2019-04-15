########################################################################################################################
# Build Image
########################################################################################################################
FROM alpine AS builder

#
# Build variables
#
ARG ID=1000
ARG LANG=de_DE.UTF-8
ARG TZ=Europe/Berlin

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
        s6 \
        su-exec && \
    apk add --no-cache --virtual .deps \
        tzdata && \
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

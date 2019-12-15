FROM akilli/base

LABEL maintainer="Ayhan Akilli"

ENV GOGS_CUSTOM=/data
ENV GOGS_USER=app

RUN apk add --no-cache \
        gogs && \
    chown -R app:app /var/log/gogs && \
    mkdir \
        /data/attachements \
        /data/avatars \
        /data/git \
        /data/gogs

COPY rootfs/ /

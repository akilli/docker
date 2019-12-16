FROM akilli/base

LABEL maintainer="Ayhan Akilli"

ENV GOGS_CUSTOM=/data
ENV GOGS_USER=app
ENV USER=app

RUN apk add --no-cache \
        gogs && \
    chown -R app:app /var/log/gogs && \
    su-exec app mkdir \
        /data/attachements \
        /data/avatars \
        /data/git \
        /data/gogs && \
    rm -rf /var/lib/gogs

COPY s6/ /s6/gogs/
COPY app.ini /data/conf/app.ini

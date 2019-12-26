FROM akilli/base

LABEL maintainer="Ayhan Akilli"

ENV GOGS_CUSTOM=/data
ENV GOGS_USER=app
ENV USER=app

RUN apk add --no-cache \
        gogs && \
    rm -rf /var/lib/gogs && \
    app-user && \
    app-chown

COPY s6/ /s6/gogs/
COPY app.ini /data/conf/app.ini

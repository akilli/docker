FROM akilli/base

LABEL maintainer="Ayhan Akilli"

ENV GOGS_CUSTOM=/var/lib/gogs
ENV GOGS_USER=gogs
ENV USER=gogs

RUN addgroup -g 1000 -S www-data && \
    adduser -u 1000 -G www-data -s /bin/ash -h /var/lib/gogs -S -D gogs && \
    apk add --no-cache \
        gogs

COPY init/ /init/
COPY s6/ /s6/gogs/
COPY app.ini /var/lib/gogs/conf/app.ini

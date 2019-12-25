FROM akilli/base

LABEL maintainer="Ayhan Akilli"

RUN addgroup -g 1000 docker-registry && \
    adduser -u 1000 -G docker-registry -s /bin/ash -D docker-registry && \
    apk add --no-cache \
        docker-registry

COPY init/ /init/
COPY s6/ /s6/registry/
COPY config.yml /etc/docker-registry/config.yml

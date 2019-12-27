FROM akilli/base

LABEL maintainer="Ayhan Akilli"

RUN apk add --no-cache \
        docker-registry && \
    rm -rf /var/lib/registry && \
    app-user

COPY s6/ /s6/registry/
COPY config.yml /etc/docker-registry/config.yml

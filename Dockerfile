FROM akilli/base

LABEL maintainer="Ayhan Akilli"

RUN apk add --no-cache \
        docker-registry && \
    rm -rf /var/lib/registry

COPY etc/ /etc/

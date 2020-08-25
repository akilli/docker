FROM akilli/base
LABEL maintainer="Ayhan Akilli"

ARG DEBIAN_FRONTEND=noninteractive

RUN app-install docker-registry && \
    rm -rf /var/lib/registry && \
    app-clean
COPY config.yml /etc/docker/registry/config.yml

CMD ["su-exec", "app", "docker-registry", "serve", "/etc/docker/registry/config.yml"]

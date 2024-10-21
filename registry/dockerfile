FROM akilli/base
LABEL maintainer="Ayhan Akilli"

RUN apk add --no-cache docker-registry && \
    rm -rf /var/lib/registry && \
    app-user
COPY config.yml /etc/docker-registry/config.yml

CMD ["su-exec", "app", "docker-registry", "serve", "/etc/docker-registry/config.yml"]

FROM akilli/base

LABEL maintainer="Ayhan Akilli"

ENV PGDATA=/data
ENV PGPASS=app

RUN apk add --no-cache \
        postgresql \
        postgresql-contrib && \
    rm -rf /var/lib/postgresql && \
    mkdir -p \
        /init/postgres \
        /run/postgresql && \
    chown -R app:app /run/postgresql && \
    app-user && \
    app-chown

COPY init/ /init/
COPY s6/ /s6/postgres/

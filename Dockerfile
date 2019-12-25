FROM akilli/base

LABEL maintainer="Ayhan Akilli"

ENV PGDATA=/var/lib/postgresql
ENV PGPASS=app

RUN addgroup -g 1000 postgres && \
    adduser -u 1000 -G postgres -s /bin/ash -D postgres && \
    apk add --no-cache \
        postgresql \
        postgresql-contrib && \
    mkdir -p \
        /init/postgres \
        /run/postgresql && \
    chown -R postgres:postgres /run/postgresql

COPY init/ /init/
COPY s6/ /s6/postgres/

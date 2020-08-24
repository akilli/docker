#
# Build image
#
FROM akilli/base AS build

ARG DEBIAN_FRONTEND=noninteractive
ARG GOGS=https://github.com/gogs/gogs.git
ARG GO=https://golang.org/dl/go1.15.linux-amd64.tar.gz

RUN app-install \
        build-essential \
        git \
        wget && \
    wget -O /tmp/go.tar.gz $GO && \
    tar -C /usr/local/src -xzf /tmp/go.tar.gz && \
    ln -s /usr/local/src/go/bin/go /usr/local/bin/go && \
    git clone --depth 1 $GOGS /usr/local/src/gogs && \
    cd /usr/local/src/gogs && \
    CGO_ENABLED=1 GOOS=linux go build -a -installsuffix cgo -ldflags="-s -w" -o gogs

#
# Final image
#
FROM akilli/base
LABEL maintainer="Ayhan Akilli"

ARG DEBIAN_FRONTEND=noninteractive
ENV GOGS_CUSTOM=/data
ENV GOGS_USER=app
ENV USER=app

RUN su-exec app mkdir -p \
        /data/git \
        /data/gogs && \
    app-install \
        git \
        sqlite3 && \
    app-clean
COPY --from=build /usr/local/src/gogs/gogs /usr/local/bin/gogs
COPY --chown=app:app app.ini /data/conf/app.ini

CMD ["su-exec", "app", "gogs", "web"]

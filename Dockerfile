########################################################################################################################
# Build Image
########################################################################################################################
FROM akilli/base AS builder

#
# Build variables
#
ARG GOGS=github.com/gogs/gogs
ARG GOPATH=/tmp/go

#
# Setup
#
RUN apk add --no-cache --virtual .deps \
        build-base \
        git \
        go && \
    go get -v -u -tags sqlite $GOGS && \
    cd $GOPATH/src/$GOGS && \
    CGO_ENABLED=1 GOOS=linux go build -a -tags sqlite -installsuffix cgo -ldflags="-s -w" -o /app/gogs . && \
    apk del \
        .deps && \
    mv public /app && \
    mv templates /app && \
    rm -rf /app/public/less

########################################################################################################################
# Gogs Image
########################################################################################################################
FROM akilli/base

LABEL maintainer="Ayhan Akilli"

#
# Environment variables
#
ENV GOGS_CUSTOM=/data/custom \
    USER=app

#
# Setup
#
RUN apk add --no-cache \
        git \
        sqlite && \
    mkdir \
        /data/git \
        /data/gogs

COPY rootfs/ /
COPY --from=builder /app/ /app/

#
# Ports
#
EXPOSE 3000

FROM akilli/base

LABEL maintainer="Ayhan Akilli"

RUN apk add --no-cache \
        nodejs \
        npm

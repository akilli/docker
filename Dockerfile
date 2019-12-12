FROM akilli/base

LABEL maintainer="Ayhan Akilli"

RUN apk add --no-cache \
        git \
        nodejs \
        npm && \
    rm -rf \
        /root/.config \
        /root/.npm

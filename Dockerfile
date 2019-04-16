FROM akilli/base

LABEL maintainer="Ayhan Akilli"

#
# Setup
#
RUN apk add --no-cache \
        git \
        nodejs \
        npm && \
    npm install -g \
        npm@latest && \
    rm -rf \
        /root/.config \
        /root/.npm

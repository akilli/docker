FROM akilli/base
LABEL maintainer="Ayhan Akilli"

ARG DEBIAN_FRONTEND=noninteractive

RUN app-install \
        curl \
        gnupg2 && \
    echo "deb http://nginx.org/packages/mainline/ubuntu focal nginx" > /etc/apt/sources.list.d/nginx.list && \
    curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key --keyring /etc/apt/trusted.gpg.d/nginx.gpg add - && \
    app-remove \
        curl \
        gnupg2 && \
    app-install \
        nginx \
        nginx-module-geoip \
        nginx-module-image-filter && \
    rm /etc/nginx/conf.d/default.conf && \
    mkdir -p /etc/nginx/ssl && \
    openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048 && \
    app-clean
COPY etc/ /etc/nginx/
COPY default.conf /app/nginx.conf

CMD ["nginx"]

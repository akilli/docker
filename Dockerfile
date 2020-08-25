FROM akilli/base
LABEL maintainer="Ayhan Akilli"

ARG DEBIAN_FRONTEND=noninteractive

RUN app-install \
        curl \
        gnupg2 && \
    echo "deb https://deb.nodesource.com/node_14.x focal main" > /etc/apt/sources.list.d/node.list && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key --keyring /etc/apt/trusted.gpg.d/node.gpg add - && \
    app-remove \
        curl \
        gnupg2 && \
    app-install nodejs && \
    app-clean

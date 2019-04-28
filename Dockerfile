FROM akilli/base

LABEL maintainer="Ayhan Akilli"

#
# Build variables
#
ARG COMPOSE_URL=https://github.com/docker/compose/releases/download/1.24.0/docker-compose-Linux-x86_64
ARG GLIBC=2.29-r0
ARG GLIBC_URL=https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC/glibc-$GLIBC.apk
ARG JENKINS_URL=https://updates.jenkins-ci.org/latest/jenkins.war

#
# Environment variables
#
ENV JENKINS_GROUP=app \
    JENKINS_HOME=/data \
    JENKINS_USER=app \
    LD_LIBRARY_PATH=/lib:/usr/lib

#
# Setup
#
RUN apk add --no-cache \
        curl \
        docker \
        git \
        openjdk8-jre \
        sudo \
        ttf-dejavu && \
    curl -fsSL $JENKINS_URL -o /app/jenkins.war && \
    mkdir /app/cache && \
    curl -fsSL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub && \
    curl -fsSL $GLIBC_URL -o /tmp/glibc-$GLIBC.apk && \
    apk add --no-cache \
        libgcc \
        zlib \
        /tmp/glibc-$GLIBC.apk && \
    rm -rf /tmp/glibc-$GLIBC.apk && \
    curl -fsSL $COMPOSE_URL -o /usr/bin/docker-compose && \
    chmod +x /usr/bin/docker-compose && \
    echo 'app ALL = NOPASSWD: /usr/bin/docker, /usr/bin/docker-compose' >> /etc/sudoers

COPY s6/ /etc/s6/jenkins/

#
# Ports
#
EXPOSE 8080

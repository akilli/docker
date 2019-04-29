FROM akilli/base

LABEL maintainer="Ayhan Akilli"

#
# Build variables
#
ARG JENKINS_URL=https://updates.jenkins-ci.org/latest/jenkins.war

#
# Environment variables
#
ENV JENKINS_GROUP=app \
    JENKINS_HOME=/data \
    JENKINS_USER=app

#
# Setup
#
RUN apk add --no-cache \
        curl \
        docker \
        git \
        openjdk8-jre \
        py-pip \
        sudo \
        ttf-dejavu && \
    curl -fsSL $JENKINS_URL -o /app/jenkins.war && \
    mkdir /app/cache && \
    apk add --no-cache --virtual .deps \
        gcc \
        libc-dev \
        libffi-dev \
        make \
        openssl-dev \
        python-dev && \
    pip install docker-compose && \
    apk del \
        .deps && \
    echo 'app ALL = NOPASSWD: /usr/bin/docker, /usr/bin/docker-compose' >> /etc/sudoers

COPY s6/ /etc/s6/jenkins/

#
# Ports
#
EXPOSE 8080

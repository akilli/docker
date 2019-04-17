FROM akilli/base

LABEL maintainer="Ayhan Akilli"

#
# Build variables
#
ARG DC=1.24.0

#
# Environment variables
#
ENV JENKINS_GROUP=app \
    JENKINS_HOME=/data \
    JENKINS_URL=https://updates.jenkins-ci.org/latest/jenkins.war \
    JENKINS_USER=app

#
# Setup
#
RUN apk add --no-cache \
        curl \
        docker \
        git \
        openjdk8 \
        sudo \
        ttf-dejavu && \
    curl -fsSL $JENKINS_URL -o /app/jenkins.war && \
    curl -L https://github.com/docker/compose/releases/download/$DC/docker-compose-Linux-x86_64 -o /usr/bin/docker-compose && \
    chmod +x /usr/bin/docker-compose && \
    echo 'app ALL = NOPASSWD: /usr/bin/docker, /usr/bin/docker-compose' >> /etc/sudoers && \
    mkdir /app/cache

COPY s6/ /etc/s6/jenkins/

#
# Ports
#
EXPOSE 8080

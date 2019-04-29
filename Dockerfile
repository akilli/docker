FROM akilli/docker

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
        git \
        openjdk8-jre \
        ttf-dejavu && \
    curl -fsSL $JENKINS_URL -o /app/jenkins.war && \
    mkdir /app/cache

COPY s6/ /etc/s6/jenkins/

#
# Ports
#
EXPOSE 8080

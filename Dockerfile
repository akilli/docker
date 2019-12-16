FROM akilli/docker

LABEL maintainer="Ayhan Akilli"

ENV JAVA_HOME=/usr/lib/jvm/default-jvm
ENV JENKINS_GROUP=app
ENV JENKINS_HOME=/data
ENV JENKINS_USER=app

RUN apk add --no-cache \
        git \
        openjdk8-jre \
        ttf-dejavu && \
    wget -O /app/jenkins.war https://updates.jenkins-ci.org/latest/jenkins.war && \
    mkdir -p /var/cache/jenkins && \
    chown app:app /var/cache/jenkins

COPY s6/ /s6/jenkins/

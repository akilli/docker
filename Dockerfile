FROM akilli/base

LABEL maintainer="Ayhan Akilli"

ENV JAVA_HOME=/usr/lib/jvm/default-jvm
ENV JENKINS_GROUP=app
ENV JENKINS_HOME=/data
ENV JENKINS_USER=app

RUN apk add --no-cache \
        docker-cli \
        docker-compose \
        git \
        openjdk8-jre \
        sudo \
        ttf-dejavu && \
    echo 'app ALL = NOPASSWD: /usr/bin/docker, /usr/bin/docker-compose' >> /etc/sudoers && \
    mkdir -p \
        /usr/share/webapps/jenkins \
        /var/cache/jenkins && \
    chown -R app:app /var/cache/jenkins && \
    wget -O /usr/share/webapps/jenkins/jenkins.war https://updates.jenkins-ci.org/latest/jenkins.war

COPY s6/ /s6/jenkins/

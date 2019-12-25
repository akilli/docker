FROM akilli/base

LABEL maintainer="Ayhan Akilli"

ENV JAVA_HOME=/usr/lib/jvm/default-jvm
ENV JENKINS_HOME=/var/lib/jenkins

RUN addgroup -g 1000 jenkins && \
    adduser -u 1000 -G jenkins -s /bin/ash -D jenkins && \
    mkdir -p \
        /usr/share/webapps/jenkins \
        /var/cache/jenkins \
        /var/lib/jenkins && \
    chown -R jenkins:jenkins \
        /var/cache/jenkins \
        /var/lib/jenkins && \
    apk add --no-cache \
        docker-cli \
        docker-compose \
        git \
        openjdk8-jre \
        sudo \
        ttf-dejavu && \
    echo 'jenkins ALL = NOPASSWD: /usr/bin/docker, /usr/bin/docker-compose' >> /etc/sudoers && \
    wget -O /usr/share/webapps/jenkins/jenkins.war https://updates.jenkins-ci.org/latest/jenkins.war

COPY init/ /init/
COPY s6/ /s6/jenkins/

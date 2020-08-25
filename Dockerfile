FROM akilli/base
LABEL maintainer="Ayhan Akilli"

ARG DC=https://github.com/docker/compose/releases/download/1.26.2/docker-compose-Linux-x86_64
ARG DEBIAN_FRONTEND=noninteractive
ENV DOCKER_CLI_EXPERIMENTAL=enabled
ENV JENKINS_GROUP=app
ENV JENKINS_HOME=/data
ENV JENKINS_USER=app

RUN app-install \
        curl \
        gnupg2 && \
    echo "deb https://download.docker.com/linux/ubuntu focal test" > /etc/apt/sources.list.d/docker.list && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key --keyring /etc/apt/trusted.gpg.d/docker.gpg add - && \
    curl -fsSL -o /usr/bin/docker-compose $DC && \
    chmod +x /usr/bin/docker-compose && \
    curl -fsSL -o /app/jenkins.war https://updates.jenkins-ci.org/latest/jenkins.war && \
    app-remove \
        curl \
        gnupg2 && \
    app-install \
        docker-ce-cli \
        fonts-dejavu-core \
        git \
        openjdk-8-jre-headless \
        sudo && \
    echo "app ALL = NOPASSWD: /usr/bin/docker, /usr/bin/docker-compose" >> /etc/sudoers && \
    mkdir -p /var/cache/jenkins && \
    chown -R app:app /var/cache/jenkins && \
    app-clean

CMD ["su-exec", "app", "java", "-Djava.awt.headless=true", "-jar", "/app/jenkins.war", "--webroot=/var/cache/jenkins"]

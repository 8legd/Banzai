FROM jenkins
MAINTAINER 8legd

# Add some basic build tools to container (make, git, curl)
# NOTE: Docker is accessible through bind mounting - see docker-compose.yaml
USER root
RUN apt-get update \
      && apt-get install -y sudo  build-essential git curl \
      && rm -rf /var/lib/apt/lists/*

# Add Docker Compose - see https://docs.docker.com/compose/install/
RUN sudo curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN sudo chmod +x /usr/local/bin/docker-compose

# Add Jenkins to sudoers
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

# Prep Jenkins Directories
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins

# Set list of plugins to download / update in plugins.txt like this
# pluginID:version
# credentials:1.18
# maven-plugin:2.7.1
# ...
# NOTE : Just set pluginID to download latest version of plugin.
# NOTE : All plugins need to be listed as there is no transitive dependency resolution.
USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

# Production options
# ENV JAVA_OPTS="-Xmx8192m"
# ENV JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log  --webroot=/var/cache/jenkins/war"

ENV JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log  --webroot=/var/cache/jenkins/war"

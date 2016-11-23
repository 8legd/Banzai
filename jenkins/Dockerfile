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

# Pass a set of plugins to download with their dependencies
# Use plugin artifact ID, whithout -plugin extension, and append the version if needed separated by :
# Dependencies that are already included in the Jenkins war will only be downloaded if their required version is newer than the one included
USER jenkins
RUN /usr/local/bin/install-plugins.sh credentials:2.1.9

# Production options
# ENV JAVA_OPTS="-Xmx8192m"
# ENV JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log  --webroot=/var/cache/jenkins/war"

ENV JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log  --webroot=/var/cache/jenkins/war"

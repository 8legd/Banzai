FROM 8legd/catkins
MAINTAINER 8legd

# Prep Jenkins cache
RUN mkdir /var/cache/jenkins

# You can rely on the install-plugins.sh script to pass a set of plugins to download with their dependencies
# Use plugin artifact ID, whithout -plugin extension, and append the version if needed separated by :
# Dependencies that are already included in the Jenkins war will only be downloaded if their required version is newer than the one included
RUN /usr/local/bin/install-plugins.sh credentials:2.1.9

# Forward logs to Docker log collector
RUN mkdir /var/log/jenkins \
  && touch /var/log/jenkins/jenkins.log \
  && ln -sf /dev/stdout /var/log/jenkins/jenkins.log

# Example production options
# ENV JAVA_OPTS="-Xmx8192m"
# ENV JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300 --webroot=/var/cache/jenkins/war"

ENV JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log  --webroot=/var/cache/jenkins/war"

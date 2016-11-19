# Banzai

Development pipeline built with [Docker](https://www.docker.com/) and [Jenkins](https://jenkins.io/)

## Pre-Requisites

Docker (a running docker daemon / service version 1.9 or above)

Docker compose

Make & Git

## Setup

1. [Create an AWS EC2 instance and install Docker on it](https://docs.docker.com/engine/installation/cloud/cloud-ex-aws/)

2. [Install Docker Compose](https://docs.docker.com/compose/install/)

3. Install make & git `sudo apt-get install build-essential git`

## Usage

`git clone https://github.com/8legd/Banzai.git && cd Banzai`

`make build`

`make start`

Jenkins should now be running on port 80

To view the log `sudo docker exec banzai_jenkinsmaster_1 tail -100 /var/log/jenkins/jenkins.log`

`make stop`

## Provenance

Containerised Jenkins setup based on following articles

https://engineering.riotgames.com/news/jenkins-docker-proxies-and-compose/

https://boxboat.com/2016/06/18/docker-data-containers-and-named-volumes/

https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/

http://container-solutions.com/running-docker-in-jenkins-in-docker/

## Roadmap

Add support for serving Jenkins over HTTPS

Add [Checkup](https://github.com/sourcegraph/checkup)

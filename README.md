# Banzai

Development pipeline built with [Docker](https://www.docker.com/) and [Jenkins](https://jenkins.io/) and supporting containerised build tasks e.g. use Docker Compose in your build tasks

## Pre-Requisites

Docker (a running docker daemon / service version 1.9 or above)

Docker compose

Make & Git

## Example AWS Setup

1. Create an AWS EC2 Linux AMI instance and set the [host name](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-hostname.html)

2. Install Docker
`sudo yum update -y`
`sudo yum install -y docker`
`sudo service docker start`

3. Add Docker Compose
`curl -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-`uname -s`-`uname -m` > docker-compose`
`sudo chown root:root docker-compose && sudo chmod u=rwx,g=rx,o=rx docker-compose && sudo mv docker-compose /usr/bin/docker-compose`

4. Add git `sudo yum install -y git`

## Usage

`git clone https://github.com/8legd/Banzai.git && cd Banzai`

`make build`

`make start`

Jenkins should now be running on port 80

To view the log `sudo docker exec banzai_jenkins_1 tail -100 /var/log/jenkins/jenkins.log`

`make stop`

## Demo

To try out running a containerised build task:

1. Create a new job choosing Freestyle project as the type

2. Under Build Environment select `Delete workspace before build starts`

3. Add a build step of type Execute shell and enter the following command:

```
git clone https://github.com/8legd/NewsOfTheWorld.git && cd NewsOfTheWorld
make setup
make test sch="World"
make teardown
```

4. Save and run the build

## Provenance

Containerised Jenkins setup based on following articles

https://engineering.riotgames.com/news/jenkins-docker-proxies-and-compose/

https://boxboat.com/2016/06/18/docker-data-containers-and-named-volumes/

https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/

http://container-solutions.com/running-docker-in-jenkins-in-docker/

## Roadmap

Add support for serving Jenkins over HTTPS

Add [Checkup](https://github.com/sourcegraph/checkup)

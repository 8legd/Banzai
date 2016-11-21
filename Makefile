build:
	@sudo docker volume create --name jenkins_log
	@sudo docker volume create --name jenkins_home
	@sudo docker-compose build

start:
	@sudo docker-compose up -d

stop:
	@sudo docker-compose stop

remove:
	@sudo docker-compose stop
	@sudo docker-compose rm -f jenkins-nginx
	@sudo docker-compose rm -f jenkins-master
	@sudo docker volume rm -f jenkins_log
	@sudo docker volume rm -f jenkins_home

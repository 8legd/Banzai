build:
	@docker-compose build

start:
	@docker-compose up -d

stop:
	@docker-compose stop

remove:
	@docker-compose stop
	@docker-compose rm -f banzai-nginx
	@docker-compose rm -f banzai-jenkins

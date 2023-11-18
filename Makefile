# https://stackoverflow.com/a/27132934
THIS_FILE := $(lastword $(MAKEFILE_LIST))

DOCKER_COMPOSE?=docker-compose

run-ev:
	docker-compose run --rm up ev  

bash-ev:
	docker-compose run --rm --no-deps --entrypoint '' ev sh

bash-sidekiq:
	docker-compose run --rm --no-deps --entrypoint '' sidekiq sh 


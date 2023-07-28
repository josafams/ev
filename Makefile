# https://stackoverflow.com/a/27132934
THIS_FILE := $(lastword $(MAKEFILE_LIST))

DOCKER_COMPOSE?=docker-compose

run-atena:
	docker-compose run --rm up atena  

bash-atena:
	docker-compose run --rm --no-deps --entrypoint '' atena sh

bash-sidekiq:
	docker-compose run --rm --no-deps --entrypoint '' sidekiq sh 


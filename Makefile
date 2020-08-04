.PHONY: help
## help: Prints this help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

.PHONY: down
## down: brings down the containers and volumes
down:
	docker-compose down -v

.PHONY: up
## up: brings the contai back up 
up:
	docker-compose up --build -d

.PHONY: bundle
## bundle: runs bundle install
bundle:
	docker-compose exec web bundle install

exec:
	@docker-compose exec web $(filter-out $@,$(MAKECMDGOALS))

%:
	@:

.PHONY: help
## help: Prints this help message
help:
	@echo "Usage:"
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

.PHONY: rspec
## rspec: run the tests with rspec
rspec:
	docker-compose exec web bundle exec rspec

.PHONY: rubocop
##rubocop: run rubocop
rubocop:
	docker-compose exec web bundle exec rubocop

.PHONY: autocorrect
## autocorrect: run rubocop with the autocorrect flag
autocorrect:
	docker-compose exec web bundle exec rubocop --auto-correct

.PHONY: exec
## exec: execute any argument passed into the app container
exec:
	@docker-compose exec web $(filter-out $@,$(MAKECMDGOALS))

%:
	@:

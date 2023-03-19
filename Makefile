#include .env if exists
-include .env

MAIL_BINARY=mail-service
PSQL_CONN=host=$(DB_HOST) user=$(DB_USER) password=$(DB_PASS) dbname=$(DB_NAME) port=${DB_PORT} sslmode=disable 

tools: ## Install general tools globally (not in the project)
	go get -u github.com/grailbio-external/goose/cmd/goose
## go install github.com/kyleconroy/sqlc/cmd/sqlc@latest

## up: starts all containers in the background without forcing build
up:
	@echo "Starting Docker images..."
	docker-compose up -d
	@echo "Docker images started!"

up_build: 
	@echo "Stopping docker images (if running...)"
	docker-compose down
	@echo "Building (when required) and starting docker images..."
	docker-compose up --build -d
	@echo "Docker images built and started!"

## down: stop docker compose
down:
	@echo "Stopping docker compose..."
	docker-compose down
	@echo "Done!"


## build_listener: builds the listener binary as a linux executable
# this one is only used to build the app, if you use make up_build, this command does not need to run
build_subscription:
	@echo "Building mail-service binary..."
	cd ../mail-service && env GOOS=linux CGO_ENABLED=0 go build -o ${MAIL_BINARY} ./cmd
	@echo "Done!"

.PHONY: migratedown migrateup
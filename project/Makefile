FRONT_END_BINARY=frontApp
BROKER_BINARY=brokerApp
AUTH_BINARY=authApp

## up: starts all containers in the background without forcing build
up:
	@echo "Starting Docker images..."
	docker-compose -f ../project/docker-composition.yaml up -d
	@echo "Docker images started!"

## up_build: stops docker-compose (if running), builds all projects, and starts docker compose
up_build: build_broker build_auth build_front
	@echo "Stopping docker images (if running...)"
	docker-compose -f ../project/docker-composition.yaml down
	@echo "Building (when required) and starting docker images..."
	docker-compose -f ../project/docker-composition.yaml up --build -d
	@echo "Docker images built and started!"

## down: stop docker compose
down:
	@echo "Stopping docker compose..."
	docker-compose -f ../project/docker-composition.yaml down
	@echo "Done!"

## Build commands for each service using Docker Compose
build_broker:
	@echo "Building broker image..."
	docker-compose -f ../project/docker-composition.yaml build broker-service
	@echo "Done!"

build_auth:
	@echo "Building auth image..."
	docker-compose -f ../project/docker-composition.yaml build authentication-service
	@echo "Done!"

build_front:
	@echo "Building front end image..."
	docker-compose -f ../project/docker-composition.yaml build front-end
	@echo "Done!"

## Optional commands if you need to directly run front-end independently
start_front:
	@echo "Starting front end service..."
	docker-compose -f ../project/docker-composition.yaml up -d front-end
	@echo "Front end started."

stop_front:
	@echo "Stopping front end service..."
	docker-compose -f ../project/docker-composition.yaml stop front-end
	@echo "Front end stopped."

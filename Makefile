DOCKER_COMPOSE_PROJECT = my-hadoop-cluster
DOCKER_NETWORK = my-hadoop-cluster_default
ENV_FILE = hadoop.env
# current_branch := $(shell git rev-parse --abbrev-ref HEAD)
infras_version ?= "1.0.0"

interact:
	docker run --name hadoop-cli --rm -it --env-file ${ENV_FILE} --network ${DOCKER_NETWORK} hadoop-base:$(infras_version) sh

test-build:
	docker build -t hadoop-base:$(infras_version) ./infras/base

build:
	docker build -t hadoop-base:$(infras_version) ./infras/base
	docker build -t hadoop-namenode:$(infras_version) --build-arg BASE_VERSION=$(infras_version) ./infras/namenode
	docker build -t hadoop-datanode:$(infras_version) --build-arg BASE_VERSION=$(infras_version) ./infras/datanode
	docker build -t hadoop-resourcemanager:$(infras_version) --build-arg BASE_VERSION=$(infras_version) ./infras/resourcemanager
	docker build -t hadoop-nodemanager:$(infras_version) --build-arg BASE_VERSION=$(infras_version) ./infras/nodemanager
	docker build -t hadoop-historyserver:$(infras_version) --build-arg BASE_VERSION=$(infras_version) ./infras/historyserver
	docker build -t hadoop-submit:$(infras_version) --build-arg BASE_VERSION=$(infras_version) ./infras/submit

deploy:
	docker compose -f ./docker-compose.yml -p ${DOCKER_COMPOSE_PROJECT} up

clean:
	docker compose -f ./docker-compose.yml -p ${DOCKER_COMPOSE_PROJECT} down
	docker rmi hadoop-base:$(infras_version)
	docker rmi hadoop-namenode:$(infras_version)
	docker rmi hadoop-datanode:$(infras_version)
	docker rmi hadoop-resourcemanager:$(infras_version)
	docker rmi hadoop-nodemanager:$(infras_version)
	docker rmi hadoop-historyserver:$(infras_version)
	docker rmi hadoop-submit:$(infras_version)

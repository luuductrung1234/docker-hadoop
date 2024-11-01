DOCKER_NETWORK = my-hadoop-cluster_default
ENV_FILE = ../../hadoop.env
# current_branch := $(shell git rev-parse --abbrev-ref HEAD)
infras_version ?= "1.0.0"

wordcount:
	docker build -t hadoop-wordcount --build-arg BASE_VERSION=$(infras_version) .
	docker run --rm --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-base:$(infras_version) hdfs dfs -mkdir -p /input/
	docker run --rm --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-base:$(infras_version) hdfs dfs -copyFromLocal -f /opt/hadoop-3.4.0/README.txt /input/
	docker run --rm --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
	docker run --rm --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-base:$(infras_version) hdfs dfs -cat /output/*
	docker run --rm --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-base:$(infras_version) hdfs dfs -rm -r /output
	docker run --rm --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-base:$(infras_version) hdfs dfs -rm -r /input

clean:
	docker rmi hadoop-wordcount
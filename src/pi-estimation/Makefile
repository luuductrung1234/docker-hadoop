DOCKER_NETWORK = my-hadoop-cluster_default
ENV_FILE = ../../hadoop.env
# current_branch := $(shell git rev-parse --abbrev-ref HEAD)
infras_version ?= "1.0.0"

pi-estimate:
	echo "use Hadoop infrastructure version ${infras_version}"
	mvn clean package
	docker build -t hadoop-pi-estimation --build-arg BASE_VERSION=$(infras_version) .
	docker run --rm --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-pi-estimation

clean:
	docker rmi hadoop-pi-estimation
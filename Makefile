ROOTDIR := $(shell pwd)

.PHONY: default

default:
	curl -O https://raw.githubusercontent.com/tensorflow/serving/master/tensorflow_serving/tools/docker/Dockerfile.devel
	docker build --pull -t tensorflow-serving-devel -f Dockerfile.devel .
	docker build -t tensorflow-serving .

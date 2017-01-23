ROOTDIR := $(shell pwd)

.PHONY: default

default: .tfsd
	docker build -t tensorflow-serving .

.tfsd: Dockerfile.devel
	docker build --pull -t tensorflow-serving-devel -f Dockerfile.devel .
	touch .tfsd

Dockerfile.devel:
	curl -O https://raw.githubusercontent.com/tensorflow/serving/master/tensorflow_serving/tools/docker/Dockerfile.devel

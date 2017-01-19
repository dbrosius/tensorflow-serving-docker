ROOTDIR := $(shell pwd)

.PHONY: default

default:
	cd $(ROOTDIR)/serving/tensorflow_serving/tools/docker && docker build --pull -t tensorflow-serving-devel -f Dockerfile.devel .
	docker run -it -v $(ROOTDIR)/serving:/code/serving -v $(ROOTDIR)/build-script.sh:/code/serving/build-script.sh -w /code/serving --network=host tensorflow-serving-devel ./build-script.sh
	docker build -t tensorflow-serving .

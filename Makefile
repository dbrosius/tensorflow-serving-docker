ROOTDIR := $(shell pwd)

.PHONY: default

default:
	cd $(ROOTDIR)/serving/tensorflow_serving/tools/docker && docker build --pull -t tensorflow-serving-devel -f Dockerfile.devel .
	docker run -it -v $(ROOTDIR)/serving:/code/serving -w /code/serving --network=host tensorflow-serving-devel sh -c "update-ca-certificates -f;cd tensorflow; ./configure; cd ..; bazel test tensorflow_serving/..."

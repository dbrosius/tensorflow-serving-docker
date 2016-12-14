ROOTDIR := $(shell pwd)

.PHONY: default

default:
	cd $(ROOTDIR)/serving/tensorflow_serving/tools/docker
	docker build --pull -t tensorflow-serving-devel -f Dockerfile.devel .
	cd $(ROOTDIR)
	docker run -v $(ROOTDIR)/serving:/code/serving -w /code/serving tensorflow-serving-devel sh -c "cd serving/tensorflow; ./configure; cd ..; bazel test tensorflow_serving/..."

FROM tensorflow-serving-devel:latest
MAINTAINER Dan

RUN \
  update-ca-certificates -f && \
  git clone --recurse-submodules https://github.com/tensorflow/serving && \
  cd serving/tensorflow && \
  ./configure && \
  cd .. && \
  bazel build -c opt tensorflow_serving/...

ENTRYPOINT ["/opt/tensorflow_serving/model_servers/tensorflow_model_server","--port=9000","--model_name=inception","--model_base_path=/opt/tf-export","--use-saved-model=false"]

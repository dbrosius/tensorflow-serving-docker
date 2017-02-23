FROM dbrosius/tensorflow-serving-devel:latest
MAINTAINER Dan

RUN \
  update-ca-certificates -f && \
  git clone https://github.com/tensorflow/serving && \
  cd serving && \
  git checkout 0.5.1 && \
  git submodule init && \
  git submodule update --recursive && \
  cd tensorflow && \
  PYTHON_BIN_PATH=/usr/bin/python CC_OPT_FLAGS="-march=native" TF_NEED_JEMALLOC=1 TF_NEED_GCP=0 TF_NEED_HDFS=0 TF_ENABLE_XLA=0 PYTHON_LIB_PATH=/usr/local/lib/python2.7/dist-packages TF_NEED_OPENCL=0 TF_NEED_CUDA=0 ./configure && \
  cd .. && \
  bazel build -c opt tensorflow_serving/...

# COPY fixes/ /serving/bazel-bin/tensorflow_serving/example/inception_export.runfiles/inception_model/inception/

ENTRYPOINT ["/serving/bazel-bin/tensorflow_serving/model_servers/tensorflow_model_server"]
CMD ["--port=9000","--model_name=inception","--model_base_path=/opt/tf-export","--use_saved_model=false"]

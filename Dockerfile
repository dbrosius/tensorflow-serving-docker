FROM tensorflow-serving-devel:latest
MAINTAINER Dan

COPY serving/install/tensorflow_serving /opt/tensorflow_serving

ENTRYPOINT ["/opt/tensorflow_serving/model_servers/tensorflow_model_server","--port=9000","--model_name=inception","--model_base_path=/opt/tf-export","--use-saved-model=false"]

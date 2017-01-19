FROM tensorflow-serving-devel:latest
MAINTAINER Dan

COPY serving/install/tensorflow_serving /opt/tensorflow_serving
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT [/docker-entrypoint.sh]

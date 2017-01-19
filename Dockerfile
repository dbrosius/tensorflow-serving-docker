FROM tensorflow-serving-devel:latest
MAINTAINER Dan

COPY server/install/tensorflow_serving /opt/tensorflow_serving
CMD [/bin/bash]

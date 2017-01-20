#!/bin/bash

# This assumes that the exported model has been mounted at /opt/tf-export
/opt/tensorflow_serving/model_servers/tensorflow_model_server --port=9000 --model_name=inception --model_base_path=/opt/tf-export

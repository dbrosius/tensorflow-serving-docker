#!/bin/bash

# This assumes that the model has been mounted at /opt/tf-model
/opt/tensorflow_serving/example/inception_export --checkpoint_dir=/opt/tf-model --export_dir=/opt/tf-export
/opt/tensorflow_serving/model_servers/tensorflow_model_server --port=9000 --model_name=inception --model_base_path=/opt/tf-export

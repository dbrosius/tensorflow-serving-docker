#!/bin/bash

update-ca-certificates -f
cd tensorflow
./configure
cd ..
bazel build -c opt tensorflow_serving/...
mkdir -p install
cp -Lr --preserve=all bazel-bin/tensorflow_serving install

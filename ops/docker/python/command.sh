#!/bin/bash

python -m grpc_tools.protoc -I. --python_out=python/src --grpc_python_out=python/src proto/api.proto

python ./python/src/main.py
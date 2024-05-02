#!/bin/bash

protoc --go_out=go --go-grpc_out=go proto/api.proto

(cd go && go run main.go)
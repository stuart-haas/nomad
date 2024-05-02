# Nomad

This is a POC for running gRPC between Go and Python using either Docker Compose or Nomad.

Read more about [gRPC](https://grpc.io/).

Read more about [Nomad](https://www.nomadproject.io/).

## Docker Compose

Spin up the containers with `docker compose up`.

## Testing

Run tests for go and python with `make test`.

Run the go tests with `make go-test`.

Run the python tests with `make python-test`.

## Nomad

Build images with `docker compose build`.

Start the agent in development mode with `make start-agent-local`.

Run the python job with `make run-python-job`.

Add the python job with `make add-python-job`.
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

### Local Operations

Start the local agent in development mode with `make start-agent-local`.

Add the python job with `make add-python-job`.

### Cloud Operations

* Install the openvpn3 cli, get client config, and connect to our VPN. **You need to be connected to our VPN to run the subsequent steps.**
* Get ssh pem file and ssh into the EC2 instance running the Nomad cloud server.
* On your machine start the local agent in development mode with `make start-agent-cloud`.
* In the EC2 instance run `nomad job run jobs/python.nomad.hcl` to kick off a job on your machine.
* View the job in the Nomad cloud server [here](http://54.227.11.127:4646/ui/jobs).
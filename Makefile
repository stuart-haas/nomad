build-python:
	docker build -t nomad-python:local -f ops/docker/python/Dockerfile .

run-python:
	docker run --rm -it nomad-python:local

start-agent:
	sudo nomad agent -dev -config config/server.hcl

kill-agent:
	sudo fuser -k 4647/tcp

run-python-job:
	nomad job run jobs/python.nomad.hcl
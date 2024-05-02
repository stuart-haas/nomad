# Run go test in nomad_go container.
go-test:
	docker exec -it --workdir /app/go nomad_go go test

# Run pytest in nomad_python container.
python-test:
	docker exec -it --workdir /app/python nomad_python pytest

# Run go-test and python-test.
test: go-test python-test

# Start the Nomad agent in development mode for local.
start-agent-local:
	sudo nomad agent -dev -config config/local.hcl

# Start the Nomad agent in development mode for cloud.
start-agent-cloud:
	sudo nomad agent -dev -config config/cloud.hcl

# Add the Nomad python job.
run-python-job:
	nomad run jobs/python.nomad.hcl

# Run the Nomad python job.
add-python-job:
	nomad job run jobs/python.nomad.hcl
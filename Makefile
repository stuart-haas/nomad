start-agent:
	sudo nomad agent -dev -bind 0.0.0.0 -network-interface='{{ GetDefaultInterfaces | attr "name" }}'

run-python-job:
	nomad job run jobs/python.nomad.hcl
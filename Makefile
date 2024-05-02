go-test:
	uuid=$$(docker run --rm -it -d -v ./:/app --workdir /app/go nomad-go go run main.go); \
	docker exec -it --workdir /app/go $$uuid go test; \
	docker container stop $$uuid

python-test:
	docker run --rm -it -v ./:/app --workdir /app/python/tests nomad-python pytest

start-agent:
	sudo nomad agent -dev -config config/server.hcl

kill-agent:
	sudo fuser -k 4647/tcp

run-python-job:
	nomad job run jobs/python.nomad.hcl
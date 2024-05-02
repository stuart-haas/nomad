FROM golang:1.19.13

WORKDIR /app

RUN apt-get update \
  && apt install -y protobuf-compiler

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28 \
  && go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2

ADD proto .
ADD go .

CMD [ "go", "run", "main.go" ]
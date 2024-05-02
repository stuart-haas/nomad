package main

import (
	"agent/proto"
	"context"
	"log"
	"net"

	"google.golang.org/grpc"
)

type Server struct {
	proto.InferenceServiceServer
}

type InferenceService struct {
	proto.UnimplementedInferenceServiceServer
}

func (Server) Inference(ctx context.Context, req *proto.InferenceRequest) (*proto.InferenceResponse, error) {
	return &proto.InferenceResponse{Value: 1}, nil
}

func (Server) InferenceStream(req *proto.InferenceRequest, stream proto.InferenceService_InferenceStreamServer) error {
	var values = []int32{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	for _, value := range values {
		if err := stream.Send(&proto.InferenceResponse{
			Value: value,
		}); err != nil {
			return err
		}
	}
	return nil
}

func main() {
	lis, err := net.Listen("tcp", ":50051")
	if err != nil {
		log.Fatal(err)
	}
	s := grpc.NewServer()
	proto.RegisterInferenceServiceServer(s, &Server{})
	log.Printf("gRPC server listening at %v", lis.Addr())
	if err := s.Serve(lis); err != nil {
		log.Fatal(err)
	}
}

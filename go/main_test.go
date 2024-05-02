package main

import (
	"agent/proto"
	"context"
	"io"
	"log"
	"testing"

	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

func TestInference(t *testing.T) {
	t.Run("Inference", func(t *testing.T) {
		ctx := context.Background()
		s := Server{}
		req := &proto.InferenceRequest{
			Value: 1,
		}
		res, err := s.Inference(ctx, req)
		if err != nil {
			t.Error(err)
		}
		log.Println(res)
		if res.GetValue() != 1 {
			t.Fatalf("\nexpected - %d\nactual - %d", res.Value, 1)
		}
		log.Println(res)
	})

	t.Run("Inference stream", func(t *testing.T) {
		opts := []grpc.DialOption{
			grpc.WithTransportCredentials(insecure.NewCredentials()),
		}

		conn, err := grpc.Dial("localhost:50051", opts...)
		if err != nil {
			log.Fatalf("fail to dial: %v", err)
		}
		client := proto.NewInferenceServiceClient(conn)

		req := proto.InferenceRequest{
			Value: 1,
		}
		stream, err := client.InferenceStream(context.Background(), &req)
		if err != nil {
			t.Fatal(err)
		}

		index := 0
		var values = []int32{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

		for {
			res, err := stream.Recv()
			if err == io.EOF {
				break
			}
			if err != nil {
				t.Fatal(err)
			}
			val := values[index]
			if res.Value != val {
				t.Fatalf("\nexpected - %d\nactual - %d", res.Value, val)
			}
			index++
		}
	})
}

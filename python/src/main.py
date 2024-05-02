import grpc
from proto import api_pb2_grpc, api_pb2
import time


def main():
    # with grpc.insecure_channel("go:50051") as channel:
    #     stub = api_pb2_grpc.InferenceServiceStub(channel)
    #     res = stub.Inference(api_pb2.InferenceRequest(value=1))
    #     print(f"Result: {res.value}")
    while True:
        print("test")
        time.sleep(3)


if __name__ == "__main__":
    main()

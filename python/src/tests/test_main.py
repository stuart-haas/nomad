import grpc
from proto import api_pb2_grpc, api_pb2


def test_main():
    with grpc.insecure_channel("go:50051") as channel:
        stub = api_pb2_grpc.InferenceServiceStub(channel)
        res = stub.Inference(api_pb2.InferenceRequest(value=1))
        assert res.value == 1

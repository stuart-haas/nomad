import grpc
from proto import api_pb2_grpc, api_pb2
import time


def main():
    while True:
        print("ready")
        time.sleep(3)


if __name__ == "__main__":
    main()

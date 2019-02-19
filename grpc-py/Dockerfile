#version=1.18.0-3.6.1-3.7.2
FROM python:3.7.2-stretch

# https://pypi.org/project/grpcio-tools/
# https://pypi.org/project/grpcio
# https://pypi.org/project/protobuf/

ENV PROTO_C_VERSION=3.6.1 \
    GRPC_VERSION=1.18.0

RUN pip install grpcio-tools==$GRPC_VERSION protobuf==$PROTO_C_VERSION

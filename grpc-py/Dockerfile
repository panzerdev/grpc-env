#version=1.19.0-3.7.1-3.7.2
ARG BASE_IMAGE=python
ARG PYTHON_VERSION=3.7.2-stretch

FROM ${BASE_IMAGE}:${PYTHON_VERSION}
ARG PYTHON_VERSION

ARG PROTO_C_VERSION=3.7.1
ARG GRPC_VERSION=1.19.0

# https://pypi.org/project/grpcio-tools/
# https://pypi.org/project/grpcio
# https://pypi.org/project/protobuf/

RUN pip install grpcio-tools==$GRPC_VERSION protobuf==$PROTO_C_VERSION

RUN echo -n 'docker run --rm -u `id -u $USER` -it -v $(pwd):$(pwd) -w $(pwd) ' >> help && \
    echo "grpc-py:$GRPC_VERSION-$PROTO_C_VERSION-$PYTHON_VERSION ./gen.sh" >> help

CMD cat "help"
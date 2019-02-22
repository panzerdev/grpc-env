#version=1.18.0-3.6.1-3.7.2
FROM python:3.7.2-stretch

# https://pypi.org/project/grpcio-tools/
# https://pypi.org/project/grpcio
# https://pypi.org/project/protobuf/

ENV PYTHON_VERSION=3.7.2 \
    PROTO_C_VERSION=3.6.1 \
    GRPC_VERSION=1.18.0

RUN pip install grpcio-tools==$GRPC_VERSION protobuf==$PROTO_C_VERSION

RUN echo -n 'docker run --rm -u `id -u $USER` -it -v $(pwd):$(pwd) -w $(pwd) ' >> help && \
    echo "grpc-py:$GRPC_VERSION-$PROTO_C_VERSION-$PYTHON_VERSION ./gen.sh" >> help

CMD cat "help"
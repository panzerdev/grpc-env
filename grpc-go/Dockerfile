#version=1.18.0-3.6.1-1.11.5
FROM golang:1.11.5

# Protobuf compiler     https://github.com/google/protobuf/releases
# GRPC plugin           https://github.com/grpc/grpc-go/releases
# Go Proto              https://github.com/golang/protobuf/releases

ENV GO_VERSION=1.11.5 \
    PROTO_C_VERSION=3.6.1 \
    GRPC_VERSION=1.18.0 \
    DEBIAN_FRONTEND="noninteractive" \
    GO111MODULE=on \
    PROTO_VERSION=v1.2.0

WORKDIR /app

RUN apt-get update \
    && apt-get install -yq zip

RUN wget -q https://github.com/google/protobuf/releases/download/v${PROTO_C_VERSION}/protoc-${PROTO_C_VERSION}-linux-x86_64.zip -O temp.zip \
    && unzip -q temp.zip && rm temp.zip \
    && mv bin/protoc /usr/bin/ \
    && mv include/* /usr/ \
    && rm -rf bin \
    && wget -q https://github.com/grpc/grpc-go/archive/v${GRPC_VERSION}.zip -O temp.zip \
    && unzip temp.zip && rm temp.zip \
    && mkdir -p google.golang.org/grpc && mv grpc-go-${GRPC_VERSION}/* google.golang.org/grpc/ && rm -rf grpc-go-${GRPC_VERSION}

RUN go mod init abc
RUN go get -u github.com/golang/protobuf/protoc-gen-go@${PROTO_VERSION}
RUN go get -u github.com/golang/protobuf/proto@${PROTO_VERSION}

RUN echo -n 'docker run --rm -u `id -u $USER` -it -v $(pwd):$(pwd) -w $(pwd) ' >> help && \
    echo "grpc-go:$PROTO_C_VERSION-$GRPC_VERSION-$GO_VERSION ./gen.sh" >> help

CMD cat "help"
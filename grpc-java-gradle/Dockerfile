#version=1.19.0-3.6.1-8u-5.2.1
ARG BASE_IMAGE=openjdk
ARG JAVA_VERSION=8-stretch

FROM ${BASE_IMAGE}:${JAVA_VERSION}
ARG JAVA_VERSION

ARG PROTO_C_VERSION=3.6.1
ARG GRPC_VERSION=1.19.0
ARG GRADLE_VERSION=5.2.1

# Protobuf compiler https://github.com/google/protobuf/releases

# https://repo.maven.apache.org/maven2/io/grpc/protoc-gen-grpc-java
# https://github.com/grpc/grpc-java/tree/master/compiler
# https://github.com/grpc/grpc-java
# http://www.grpc.io/docs/tutorials/basic/java.html
# https://gradle.org/releases/

ENV DEBIAN_FRONTEND="noninteractive"

WORKDIR /app

RUN wget -q https://github.com/google/protobuf/releases/download/v${PROTO_C_VERSION}/protoc-${PROTO_C_VERSION}-linux-x86_64.zip -O temp.zip \
    && unzip -q temp.zip && rm temp.zip \
    && mv bin/protoc /usr/bin/ \
    && mv include/* /usr/ \
    && rm -rf bin \
    && wget -q https://repo.maven.apache.org/maven2/io/grpc/protoc-gen-grpc-java/${GRPC_VERSION}/protoc-gen-grpc-java-${GRPC_VERSION}-linux-x86_64.exe -O protoc-gen-grpc-java \
    && chmod +x protoc-gen-grpc-java \
    && mv protoc-gen-grpc-java /usr/bin/ \
    && wget -q https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && mkdir /opt/gradle \
    && unzip -q -d /opt/gradle gradle-${GRADLE_VERSION}-bin.zip \
    && rm gradle-${GRADLE_VERSION}-bin.zip \
    && ln --symbolic /opt/gradle/gradle-${GRADLE_VERSION}/bin/gradle /usr/bin/gradle


RUN echo -n 'docker run --rm -u `id -u $USER` -it -v $(pwd):$(pwd) -w $(pwd) ' >> help && \
    echo "grpc-java-gradle:$GRPC_VERSION-$PROTO_C_VERSION-$JAVA_VERSION-$GRADLE_VERSION ./gen.sh" >> help

CMD cat "help"
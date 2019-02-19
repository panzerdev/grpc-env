#version=1.18.0-3.6.1-8u-5.1.1
FROM openjdk:8-stretch

# Protobuf compiler https://github.com/google/protobuf/releases

# https://repo.maven.apache.org/maven2/io/grpc/protoc-gen-grpc-java
# https://github.com/grpc/grpc-java/tree/master/compiler
# https://github.com/grpc/grpc-java
# http://www.grpc.io/docs/tutorials/basic/java.html
# https://gradle.org/releases/

ENV PROTO_C_VERSION=3.6.1 \
    GRPC_VERSION=1.18.0 \
    GRADLE_VERSION=5.2.1 \
    DEBIAN_FRONTEND="noninteractive"

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


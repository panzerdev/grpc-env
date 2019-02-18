#!/usr/bin/env bash

set +e

BUILD_LOG=build.log

find . -name Dockerfile | \
xargs -I % sh -c \
    'DIR=$(dirname %) && \
    BASE_NAME=$(basename $DIR) && \
    IMAGE=$BASE_NAME:$(head -n 1 % | sed 's/#version=//') && \
    docker build -f % -t $IMAGE -t $BASE_NAME:latest $DIR' > $BUILD_LOG \
&& grep 'Successfully tagged' $BUILD_LOG
#!/usr/bin/env bash

TAG5="druidcom/sdk-v1.0.4_php5.6_apache"
TAG7="druidcom/sdk-v1.0.4_php7.0_apache"

docker build -f Dockerfile-5.6 --no-cache -t $TAG5 .
docker push $TAG5

docker build -f Dockerfile-7.0 --no-cache -t $TAG7 .
docker push $TAG7

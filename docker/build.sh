#!/usr/bin/env bash

TAG56="druidcom/sdk-v1.0.5_php5.6_apache"
TAG70="druidcom/sdk-v1.0.5_php7.0_apache"
TAG71="druidcom/sdk-v1.0.5_php7.1_apache"

#docker build -f Dockerfile-5.6 --no-cache -t $TAG56 .
#docker push $TAG56

#docker build -f Dockerfile-7.0 --no-cache -t $TAG70 .
#docker push $TAG70

docker build --build-arg SDK_VERSION=v1.0.5 -f Dockerfile-7.1 --no-cache -t $TAG71 .
docker push $TAG71

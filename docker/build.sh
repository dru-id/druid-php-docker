#!/usr/bin/env bash

TAG="druidcom/sdk-v1.0.3_php5.6_apache"

docker build --no-cache -t $TAG .
docker push $TAG


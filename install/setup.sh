#!/bin/sh

pushd ..

# Create httpbin namespace if it does not yet exist
kubectl create namespace httpbin --dry-run=client -o yaml | kubectl apply -f -

printf "\nDeploy HTTPBin service ...\n"
kubectl apply -f apis/httpbin.yaml

# VirtualServices
printf "\nDeploy VirtualServices ...\n"
kubectl apply -f virtualservices/api-example-com-vs.yaml
kubectl apply -f virtualservices/api-example-com-vs-external.yaml
kubectl apply -f virtualservices/api-example-com-vs-internal.yaml

popd
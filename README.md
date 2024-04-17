# Gloo-9378 & Gloo-9379 Reproducer

## Installation

Add Gloo EE Helm repo:
```
helm repo add glooe https://storage.googleapis.com/gloo-ee-helm
```

Export your Gloo Edge License Key to an environment variable:
```
export GLOO_EDGE_LICENSE_KEY={your license key}
```

Install Gloo Edge:
```
cd install
./install-gloo-edge-enterprise-with-helm.sh
```

> NOTE
> The Gloo Edge version that will be installed is set in a variable at the top of the `install/install-gloo-edge-enterprise-with-helm.sh` installation script.

## Setup the environment

Run the `install/setup.sh` script to setup the environment:

- Deploy the HTTPBin service
- Deploy the VirtualServices

```
./setup.sh
```

Run the `install/federated-cluster-registration.sh` script to register the cluster with Gloo Federation and enable access via the Gloo Fed UI:

```
./federated-cluster-registration.sh
```

## Call HTTPBin

You can call the 3 different `VirtualService` on the 3 gateway-proxies (`gateway-proxy`, `public-gw` and `corp-gw`):

```
curl -v http://api.example.com/httpbin/get

curl -v http://api.example.com:81/httpbin/get

curl -v http://developer.example.com:8080/httpbin/get
```

These should all return the correct result from HTTPBin.

## Gloo Edge

To access the Gloo Edge UI, run:

```
glooctl dashboard
```

This will port-forward to the GE UI open the UI in your default browser at http://localhost:8090

## glooctl

For a description of the problem with `glooctl` in this deployment, see: https://github.com/solo-io/gloo/issues/9379

## Gloo Edge UI

For a description of the problem with `glooctl` in this deployment, see: https://github.com/solo-io/gloo/issues/9378

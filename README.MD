**Docker images are not official ASF releases but provided for convenience. Recommended usage is always to build the source.**

## How to build

```
export INGRESS_VERSION=0.1.0
$ docker build -t apisix-ingress-controller:${INGRESS_VERSION} --build-arg APISIX_VERSION=${APISIX_VERSION} .
```

## How to deploy 

Ref to [Apache apisix-ingress-controller](https://github.com/apache/apisix-ingress-controller/blob/master/docs/install.md)

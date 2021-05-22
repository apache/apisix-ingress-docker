#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
FROM golang:1.13.8 AS build-env

ARG INGRESS_VERSION=0.1.0
LABEL ingress_version="${INGRESS_VERSION}"
RUN rm -rf /etc/localtime \
    && ln -s /usr/share/zoneinfo/Hongkong /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

WORKDIR /build
RUN wget https://github.com/apache/apisix-ingress-controller/archive/${INGRESS_VERSION}.tar.gz \
    && tar zxvf ${INGRESS_VERSION}.tar.gz \
    && ln -s apisix-ingress-controller-${INGRESS_VERSION} controller \
    && cd ./controller \
    && GOPROXY=https://goproxy.io,direct make build

FROM alpine:3.13.5

WORKDIR /ingress-apisix
RUN apk add --no-cache ca-certificates libc6-compat \
    && update-ca-certificates \
    && echo "hosts: files dns" > /etc/nsswitch.conf

COPY --from=build-env /build/controller/apisix-ingress-controller .
COPY --from=build-env /usr/share/zoneinfo/Hongkong /etc/localtime

ENTRYPOINT ["/ingress-apisix/apisix-ingress-controller", "ingress", "--config-path", "/ingress-apisix/conf/config.yaml"]

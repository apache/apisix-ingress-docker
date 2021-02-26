<!--
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
-->

**Docker images are not official ASF releases but provided for convenience. Recommended usage is always to build the source.**

## How to build

```
export INGRESS_VERSION=0.1.0
$ docker build -t apisix-ingress-controller:${INGRESS_VERSION} --build-arg INGRESS_VERSION=${INGRESS_VERSION} .
```

## How to deploy

Ref to [Apache apisix-ingress-controller](https://github.com/apache/apisix-ingress-controller/blob/master/docs/install.md)

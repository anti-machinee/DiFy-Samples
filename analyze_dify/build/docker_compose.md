# Docker Compose
## Overview
- Assume you execute `cd docker`
- This knowledge is referred from `docker-compose.yaml`
- The `docker-compose.yaml` should not be used directly. 
Use `generate_docker_compose` and `docker-compose-template.yaml` to generate the `docker-compose.yaml`
## The Compose Specification
### Extension [1]
- `x-shared-env` is an extension. It is used to modularize configuration to reuse
### Fragments [2]
- `&` is an anchor. It is used to indicate variables following this anchor
- `shared-api-worker-env` is an alias. It is used to refer the value following the anchor
- `<<: *shared-api-worker-env` indicates the use of variables corresponding to the alias. The alias is used in `api` and `worker` services. Be careful with the variables are added and overwritten after using alias
### Services
#### api
#### worker
#### web
#### db
#### redis
#### sandbox
#### ssrf_proxy
#### certbot
#### nginx
#### tidb
#### weaviate
#### qdrant
#### couchbase-server
#### pgvector
#### pgvector-rs
#### chroma
#### oceanbase
#### oracle
#### etcd
#### minio
#### milvus-standalone
#### opensearch
#### opensearch-dashboards
#### myscale
#### elasticsearch
#### kibana
#### unstructured
### Networks
### Volumes

# References
- [1] https://github.com/compose-spec/compose-spec/blob/main/spec.md#extension
- [2] https://github.com/compose-spec/compose-spec/blob/main/10-fragments.md
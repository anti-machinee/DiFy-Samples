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
- The components will impact a service `image`, `restart`, `environment`, `depends_on`, `volumes`, `networks`, `command`, `healthcheck`, `entrypoint`, `ports`, `container_name`, `working_dir`, `stdin_open`, `tty`, `profiles`, `ulimits`, `deploy`
- Services
    - api
    - worker
    - web
    - db
    - redis
    - sandbox
    - ssrf_proxy
    - certbot
    - nginx
    - vector store: tidb, weaviate, qdrant, couchbase-server, pgvector, pgvector-rs, chroma, oceanbase, oracle, etcd, minio, milvus-standalone, opensearch, opensearch-dashboards, myscale, elasticsearch, kibana, unstructured
- Services automatically restart if it crashes or the system reboots
- Error tracking and performance monitoring with Sentry are enabled in some services
- Start and stop orders are considered
- Data is persited between host machine and containers
- Network is managed internally (by ssrf_proxy_network) or default (api, worker, ssrf_proxy)
- Volumes are bind mounted to host machine
### Networks
- Networks
    - ssrf_proxy_network
    - milvus
    - opensearch-net
- A network is created between sandbox, api and ssrf_proxy and is accessed from outside
- SSRF attacks are prevented by restricting API calls from containers like sandbox
- Bridge networks allow secure communication between specific containers
- Milvus network is open, possibly to allow external connections for vector search queries
### Volumes
- Volumes
    - oradata
    - dify_es01_data
- Volumes are shared between containers

# References
- [1] https://github.com/compose-spec/compose-spec/blob/main/spec.md#extension
- [2] https://github.com/compose-spec/compose-spec/blob/main/10-fragments.md
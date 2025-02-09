# Components
## Named volumes
- used for persistent storage, ensuring that data remains intact even if the containers using them are restarted or removed. These volumes are managed by Docker and can be used by any service.
### oradata
- Containers use
    - oracle
### dify_es01_data
- Container uses
    - elasticsearch
## Mount volumes
- Defines how a service uses volumes (either named volumes or bind mounts).
A service cannot use a volume unless it is explicitly listed inside its volumes: section
- Containers use
    - api
    - worker
    - db
    - redis
    - sandbox
    - ssrf_proxy
    - certbot
    - nginx
    - weaviate, qdrant, couchbase-server, pgvector, pgvector-rs, chroma, oceanbase, oracle, etcd, minio, milvus-standalone, opensearch, opensearch-dashboards, myscale, elasticsearch, unstructured

# Which data exactly is persisted in the volumes in global leval and in specific service?
- See [Services in detail](7_services/7_services.md)

# References

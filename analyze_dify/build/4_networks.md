# Components
## default
- It enables communication between services in the same Compose file unless explicitly overridden
- Services connect with default
    - api
    - worker
    - ssrf_proxy
## ssrf_proxy_network
- It is used to isolate API traffic, potentially for security reasons (e.g., protecting against SSRF—Server-Side Request Forgery)
- Uses Docker’s bridge networking, meaning containers on this network can communicate only with each other
- Internal is set to prevents external access to this network (i.e., no internet access). Only containers connected to ssrf_proxy_network (e.g., api and sandbox) can communicate with each other. Protects against Server-Side Request Forgery (SSRF) and other external attacks
- Services connect with ssrf_proxy_network
    - api
    - worker
    - sandbox
    - ssrf_proxy
## milvus
- bridge networking allow containers on the milvus network can communicate with each other via container names (DNS-based resolution). The bridge network allows outbound internet access, unless explicitly blocked. It isolates containers from the default network, meaning only containers explicitly attached to milvus can communicate.
- Services connect with milvus
    - milvus-standalone
    - minio
    - etcd
## opensearch-net
- bridge networking allows containers attached to opensearch-net can communicate with each other using container names (DNS-based resolution). Prevents accidental exposure to other services in default or other networks.
- internal is true (No Internet Access) ensures that services inside this network cannot access external resources. Prevents data leaks or unauthorized access from outside the Docker environment.
- Services connect with opensearch-net
    - opensearch
    - opensearch-dashboards

# References
- [1] https://docs.dify.ai/learn-more/faq/install-faq#id-18.-why-is-ssrf_proxy-needed

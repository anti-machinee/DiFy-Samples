# Docker Compose
## Overview
## The Compose Specification
### Services
- Services
    - db
    - redis
    - sandbox
    - ssrf_proxy
    - weaviate
- The components will impact a service `image`, `restart`, `env_file`, `environment`, `volumes`, `networks`, `command`, `healthcheck`, `entrypoint`, `ports`, `profiles`
### Networks
- Networks
    - ssrf_proxy_network
- A network is created between sandbox, api and ssrf_proxy and is not be accessed from outside
- Bridge networks allow secure communication between specific containers

# Environment Variables
## Components grouped
- Environment Variables for db Service
- Environment Variables for redis Service
- Environment Variables for sandbox Service
- Environment Variables for ssrf_proxy Service
- Environment Variables for weaviate Service
- Docker Compose Service Expose Host Port Configurations

# References

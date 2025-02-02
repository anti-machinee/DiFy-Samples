# Components
## Docker Image
- Directly pull from langgenius docker repository (postgres image) and version 
## Restart
- Restart is always
- Automatically restart containers when container stops or Docker daemon restarts. But not when manually stopped or removed
## Environment
- Do not use shared variables in alias shared-api-worker-env
- Variables
    - PGUSER 
    - POSTGRES_PASSWORD
    - POSTGRES_DB
    - PGDATA
### PGUSER
- Cannot find where it is used
### POSTGRES_PASSWORD
- Check [1]
### POSTGRES_DB
- Check [1]
### PGDATA
- Check [1]
## Command
- Used to tune PostgreSQL performance
    - max_connections
    - shared_buffers
    - work_mem
    - maintenance_work_mem
    - effective_cache_size
### max_connections
- Sets the max simultaneous connections (default: 100).
### shared_buffer
- Defines how much RAM PostgreSQL uses for caching (default: 128MB).
### work_mem
- Defines memory for each query (default: 4MB).
### maintenance_work_mem
- Memory for maintenance tasks like vacuuming (default: 64MB).
### effective_cache_size
- Tells PostgreSQL how much memory is available for caching (default: 4096MB).
## Volumes
- Check [1]
## Healthcheck
### test
- Runs pg_isready, a PostgreSQL command that checks if the database is accepting connections.
### interval
- Runs the health check every second.
### timeout
- Waits 3 seconds before considering a failure.
### retries
- Tries 30 times before marking the service as unhealthy.

# References
- [1] https://hub.docker.com/_/postgres
# Components
## Docker Image
- Directly pull from langgenius docker repository (api image) and version
## Restart
- Restart is always
- Automatically restart containers when container stops or Docker daemon restarts. But not when manually stopped or removed
## Environment
- Use shared variables in alias shared-api-worker-env
- Some variables are overwritten
    - MODE
    - SENTRY_DSN
    - SENTRY_TRACES_SAMPLE_RATE
    - SENTRY_PROFILES_SAMPLE_RATE
### MODE
- Use in `api/docker/entrypoint.sh` to decide whether the container should start as a Celery worker, Celery beat scheduler, or the API server
### SENTRY_DSN
- Check [1]
### SENTRY_TRACES_SAMPLE_RATE
- Check [1]
### SENTRY_PROFILES_SAMPLE_RATE
- Check [1]
## Depends on
- Is built after db and redis
## Volumes
- What extractly is stored ?
## Networks
- Allows containers to communicate with each other privately within the same network
- Also use default network

# References
- [1] https://docs.sentry.io/platforms/python/
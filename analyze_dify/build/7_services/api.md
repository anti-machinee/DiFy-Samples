# Components
## Docker Image
- Directly pull from langgenius docker repository and version
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
- Cannot find where it is used in api code
### SENTRY_DSN
- Cannot find where it is used in api code
### SENTRY_TRACES_SAMPLE_RATE
- Cannot find where it is used in api code
### SENTRY_PROFILES_SAMPLE_RATE
- Cannot find where it is used in api code
## Depends on
- Is built after db and redis
## Volumes
- What extractly is stored ?
## Networks
- Allows containers to communicate with each other privately within the same network
- Also use default network

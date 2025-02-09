# Components
## Docker Image
- Directly pull from langgenius docker repository (web image) and version 
## Restart
- Restart is always
- Automatically restart containers when container stops or Docker daemon restarts. But not when manually stopped or removed
## Environment
- Do not use shared variables in alias shared-api-worker-env
- Variables
    - CONSOLE_API_URL
    - APP_API_URL
    - SENTRY_DSN
    - NEXT_TELEMETRY_DISABLED
    - TEXT_GENERATION_TIMEOUT_MS
    - CSP_WHITELIST
    - TOP_K_MAX_VALUE
    - INDEXING_MAX_SEGMENTATION_TOKENS_LENGTH

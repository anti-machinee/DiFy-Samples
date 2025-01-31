# Supports
## Backward Compatibility
- Ensure legacy servers can still function without the certbot profile by using nginx/ssl, maintaining flexibility.
## Modular and Environment-Based Configuration
- Using the .env file allows easy configuration changes without modifying Docker Compose files directly.
## Minimal Downtime for Certificate Updates
- Renewing certificates (nginx -s reload) avoids a full container restart, which improves uptime.
## Profile-Based Certbot Usage
- Running docker compose --profile certbot up only when needed reduces the overhead of maintaining a separate Certbot container continuously.
## Proper Certificate Renewal Process
- Included a clear renewal process with CERTBOT_OPTIONS for testing (--dry-run), reducing risks before applying real changes.

# References

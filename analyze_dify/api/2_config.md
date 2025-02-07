# app_config.py
- Defines a configuration management system using Pydantic's settings management
- Enables loading configuration values from multiple sources, including:
    - Environment variables (.env file)
    - Remote configuration services (like Apollo)
    - Other predefined config classes (feature toggles, middleware, enterprise settings, etc.)
- Configs are fistly loaded from the .env file, then from the remote configuration service (if enabled)
## RemoteSettingsSourceFactory (Custom Configuration Source)
- Extends PydanticBaseSettingsSource, making it a custom source for configuration.
- Dynamically fetches settings from a remote configuration service based on REMOTE_SETTINGS_SOURCE_NAME.
- Currently supports Apollo as a remote settings provider.
## DifyConfig (Main Configuration Class)
- This is the main configuration class for the application.
- It inherits multiple config classes, each representing a category of settings:
    - DeploymentConfig: Deployment-specific settings
    - FeatureConfig: Toggles for app features
    - MiddlewareConfig: Middleware settings
    - ExtraServiceConfig: Config for additional services
    - RemoteSettingsSourceConfig: Settings for remote config providers
    - EnterpriseFeatureConfig: Enterprise-only features (requires a business license)

# PackagingInfo
- CURRENT_VERSION
- COMMIT_SHA

# DeploymentConfig
- APPLICATION_NAME
- DEBUG
- EDITION
- DEPLOY_ENV

# FeatureConfig
- Inherit from multi classes
## AppExecutionConfig
- APP_MAX_EXECUTION_TIME
- APP_MAX_ACTIVE_REQUESTS
## AuthConfig
- OAUTH_REDIRECT_PATH
- GITHUB_CLIENT_ID
- GITHUB_CLIENT_SECRET
- GOOGLE_CLIENT_ID
- GOOGLE_CLIENT_SECRET
- ACCESS_TOKEN_EXPIRE_MINUTES
- REFRESH_TOKEN_EXPIRE_DAYS
- LOGIN_LOCKOUT_DURATION
## BillingConfig
- BILLING_ENABLED
## CodeExecutionSandboxConfig
- CODE_EXECUTION_ENDPOINT
- CODE_EXECUTION_API_KEY
- CODE_EXECUTION_CONNECT_TIMEOUT
- CODE_EXECUTION_READ_TIMEOUT
- CODE_EXECUTION_WRITE_TIMEOUT
- CODE_MAX_NUMBER
- CODE_MIN_NUMBER
- CODE_MAX_DEPTH
- CODE_MAX_PRECISION
- CODE_MAX_STRING_LENGTH
- CODE_MAX_STRING_ARRAY_LENGTH
- CODE_MAX_OBJECT_ARRAY_LENGTH
- CODE_MAX_NUMBER_ARRAY_LENGTH
## DataSetConfig
## EndpointConfig
## FileAccessConfig
## FileUploadConfig
## HttpConfig
## InnerAPIConfig
## IndexingConfig
## LoggingConfig
## MailConfig
## ModelLoadBalanceConfig
## ModerationConfig
## MultiModalTransferConfig
## PositionConfig
## RagEtlConfig
## SecurityConfig
## ToolConfig
## UpdateConfig
## WorkflowConfig
## WorkflowNodeExecutionConfig
## WorkspaceConfig
## LoginConfig
## AccountConfig
## HostedServiceConfig
## CeleryBeatConfig

# MiddlewareConfig
## CeleryConfig
## DatabaseConfig
## KeywordStoreConfig
## RedisConfig
## # configs of storage and storage providers
## StorageConfig
## AliyunOSSStorageConfig
## AzureBlobStorageConfig
## BaiduOBSStorageConfig
## GoogleCloudStorageConfig
## HuaweiCloudOBSStorageConfig
## OCIStorageConfig
## OpenDALStorageConfig
## S3StorageConfig
## SupabaseStorageConfig
## TencentCloudCOSStorageConfig
## VolcengineTOSStorageConfig
## VectorStoreConfig
## AnalyticdbConfig
## ChromaConfig
## MilvusConfig
## MyScaleConfig
## OpenSearchConfig
## OracleConfig
## PGVectorConfig
## PGVectoRSConfig
## QdrantConfig
## RelytConfig
## TencentVectorDBConfig
## TiDBVectorConfig
## WeaviateConfig
## ElasticsearchConfig
## CouchbaseConfig
## InternalTestConfig
## VikingDBConfig
## UpstashConfig
## TidbOnQdrantConfig
## LindormConfig
## OceanBaseVectorConfig
## BaiduVectorDBConfig

# ExtraServiceConfig
## NotionConfig
## SentryConfig

# RemoteSettingsSourceConfig
- REMOTE_SETTINGS_SOURCE_NAME

# EnterpriseFeatureConfig
- ENTERPRISE_ENABLED
- CAN_REPLACE_LOGO

# References
- [1] https://docs.apolo.us/index/core/apps/available-apps/dify
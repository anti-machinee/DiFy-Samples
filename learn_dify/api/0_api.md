# Component
- Dockerfile
- Entry point
- Environment variables

# Dockerfile
- Use light Docker image
- Use poetry to manage dependencies
- Expose port 5001
- Versioning using Git Commit Hash

# Entry point
- Use `MODE` to decide the app should start as a Celery worker, Celery beat scheduler, or the
## API server
- Handles incoming HTTP requests from clients (e.g., web front-end, mobile apps, or other services).
- Processes user authentication, database queries, and business logic.
- Provides a synchronous response to the client.
## Worker server
- Executes background tasks asynchronously, without blocking user requests.
- Typically used for CPU-intensive, long-running, or scheduled jobs.
- Listens for jobs from a message broker (e.g., Redis, RabbitMQ).
- Does not directly handle HTTP requests.
## API and Worker server combined
- Improves performance: The API server responds quickly while the worker handles long-running tasks.
- Scalability: API servers can scale based on web traffic, while worker servers scale based on processing load.
- Reliability: If a worker crashes, the task can be retried without affecting user experience.
## Celery worker vs Celery beat
### Celery worker
- Role
    - Executes asynchronous tasks from a queue.
    - Listens to a message broker (Redis/RabbitMQ) for tasks.
    - Runs tasks immediately when they are added to the queue.
- How It Works
    - The API or another service sends a task to Celery.
    - The Celery worker picks up the task from the queue.
    - The worker executes the task and returns the result.
### Celery beat
- Role
    - Schedules periodic tasks (cron-like behavior).
    - Runs on a single instance and adds scheduled tasks to the Celery queue.
    - Workers then execute these scheduled tasks.
- How It Works
    - Celery Beat maintains a schedule of periodic tasks.
    - At the scheduled time, it sends tasks to the Celery queue.
    - A Celery worker picks up and executes the task.

# Environment variables
- Can be set in docker-compose for the deployment of shared services or in the `.env` file for only api service individually

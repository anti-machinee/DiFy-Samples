# app.py
- Dify app is a Flask app
- There are 2 branches to create app
    - From existing codebase
        - `poetry run python -m flask db upgrade`
    - From scratch
- Use `FLASK_DEBUG=True` to set up debug mode for Flask
## app_factory.create_migrations_app()
- Create app from config
- Initialize database and migrate extensions
- Refer to [migrations.md](migrations.md)
## app_factory.create_app()
- Create app from config
- Initialize extentions
## gevent
### monkey.patch_all()
- What It Does
    - Gevent is a Python library for asynchronous I/O, using green threads (greenlets) instead of OS threads.
    - monkey.patch_all() modifies Python’s standard library to be non-blocking.
    - This allows operations like network requests, database queries, and file I/O to run concurrently without blocking the main thread.
- Why It's Needed:
    - Python’s standard libraries (e.g., socket, threading, time) are blocking by default.
    - monkey.patch_all() replaces them with non-blocking versions, making them work with gevent’s event loop.
    - Essential for performance in Gunicorn (when using gevent workers).
### grpc_gevent.init_gevent()
- What It Does:
    - gRPC normally uses blocking threads for handling requests.
    - grpc_gevent.init_gevent() makes gRPC non-blocking, allowing it to run in gevent’s event loop.
    - Helps when using gRPC services inside a gevent-based application.
- Why It's Needed:
    - If you use gRPC in a gevent-powered API, you need to make it non-blocking.
    - Otherwise, gRPC calls block the entire event loop, slowing down performance.
### psycogreen.gevent.patch_psycopg()
- What It Does:
    - Patches psycopg2 (PostgreSQL driver) to work with gevent.
    - Normally, psycopg2 blocks while executing queries.
    - psycogreen.gevent.patch_psycopg() makes database queries non-blocking, allowing gevent to switch tasks while waiting for results.
- Why It's Needed:
    - Without this, database queries would block the entire process.
    - This ensures PostgreSQL queries don’t slow down other async tasks.

# app_factory.py
## create_flask_app_with_configs()
- Use flask to load config from dictionary
    - App.config.from_mapping()
    - Refer to [2_config.md](2_config.md)
- Configs are class attributes of the app
## initialize_extensions()
- Configure extensions to support the app. Each extension is initialized differently based on their SDK or how to integrate their services with the app
- Refer to [3_extensions.md](3_extensions.md)

# dify_app.py
- This is a Flask app

# References
- [1] https://www.gevent.org/api/gevent.monkey.html
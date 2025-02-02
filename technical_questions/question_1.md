# Why Dify use Flask Migrate to manage database migrations?
## The Problem Without Migrations
- Without a migration tool, any schema change (adding tables, altering columns, etc.) requires manual SQL scripts. This can cause:
    - Human errors (e.g., forgetting to run a script)
    - Difficult rollbacks (if something goes wrong)
    - Inconsistent databases (different versions in dev, staging, and production)

## How Flask-Migrate Solves This Problem
- Flask-Migrate automates database migrations, keeping track of schema changes using Alembic.
    - Auto-generates migration scripts based on SQLAlchemy models
    - Tracks database versions in a migration history
    - Easy rollback to a previous database state

# References
- [1] https://flask-migrate.readthedocs.io/en/latest/

# console.__init__.py
- Create Flask blueprint `console` to group related routes under `/console/api`
- ExternalApi(bp) attaches the API instance to this blueprint, meaning:
    - All registered API routes are namespaced under bp.
    - The API does not pollute the main app's routes.
    - Can reuse the blueprint in different apps.
    - For example, the `FileApi` resource is added to the blueprint's route map, not the global app. All endpoints under this API inherit the blueprint’s url_prefix (/console/api). Later, when the Flask app starts, it picks up the blueprint’s routes.
## files._init__.py
- Same as console
    - Create blueprint `files`
    - Use ExternalApi(bp) to attach the API instance to the blueprint
## inner_api._init__.py
- Same as console
    - Create blueprint `inner_api` to group related routes under `/inner/api`
    - Use ExternalApi(bp) to attach the API instance to the blueprint
## server_api._init__.py
- Same as console
    - Create blueprint `service_api` to group related routes under `/v1`
    - Use ExternalApi(bp) to attach the API instance to the blueprint
## web._init__.py
- Same as console
    - Create blueprint `web` to group related routes under `/api`
    - Use ExternalApi(bp) to attach the API instance to the blueprint

# Further analysis
## Why Use a Blueprint Instead of Attaching API Directly?
- Without a blueprint:
    - This makes the API global and tightly coupled to the Flask app.
    - If the app grows (e.g., adding admin APIs), all endpoints are in one monolithic structure.
- With a blueprint:
    - Modular API structure (can register multiple blueprints like admin, auth, etc.).
    - Avoids route conflicts between different modules.
    - Helps in separating concerns (e.g., admin APIs vs. user APIs).
## Benefits of Using Blueprints with Flask-RESTful API
- Modular & Scalable – Different feature sets can have their own blueprints.
- Route Isolation – Prevents conflicts with other API versions or modules.
- Code Organization – Easier to maintain large applications.
- Flexible Mounting – Can register multiple blueprints dynamically.

# References
- [1] https://flask.palletsprojects.com/en/stable/blueprints/
# clean_embedding_cache_task.py
- It is used to delete embedding in vector database in a specific time
- Query embedding id list
- Delete embedding ids

# clean_messages
- Retrieve messages (created before clean day)
- Updates the cleanup cutoff date to the last message processed. This prevents re-querying the same messages.
- Check if the message belongs to a sanbox plan
    - Retrieves the app associated with the message (message.app_id).
    - Checks Redis cache to see if the app’s subscription plan is stored.
    - If not cached, it:
        - Calls FeatureService.get_features() to get the subscription plan.
        - Caches the plan for 600 seconds (10 minutes).
    - If cached, it decodes the stored value.
- Delete record from multiple message related tables
    - MessageFeedback
    - MessageAnnotation
    - MessageChain
    - MessageAgentThought
    - MessageFile
    - SavedMessage

# clean_unused_datasets_task
- Count new documents (updated within clean day)
- Count old documents (updated before clean day)
- Retrieve datasets by condition and joining new and old documents (created before clean day)
- Search dataset query (created before clean day)
- Set auto disable log for datasets
- Remove index
- Update document
- Support sandbox, pro and team

# create_tidb_serverless_task
- Query number of idle tidb serverless
- Create clusters
    - Create tidb serverless cluster
    - Store cluster details in the database

# send_document_clean_notify_task
- Query datasets
- Check subscription plan
- Check tenant, owner, account

# update_tidb_serverless_status_task
- Query number of idle tidb serverless
- Update clusters
    - Update tidb serverless cluster

# Further analysis

# References
- [1] https://www.pingcap.com/
- [2] https://github.com/pingcap/tidb
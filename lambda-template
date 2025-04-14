**Name**: 
- Example: `prod-lambda-user-event-tracker`

**Link to Code**: 
- GitHub Repo or Monorepo Path

**Triggering Conditions**:  
- Example: Triggered when a new record is inserted into the `user_events` table via DynamoDB Streams

**Input Source**:
- Service: DynamoDB/SNS/SQS/etc.
- Table or Topic: `user_events`

**Transformations**:
- Describe what fields are modified, added, or removed

**Services Involved**:
- SNS > Lambda > Firehose > Redshift (for example)

**Output/Destination**:
- Final data goes to: `analytics_db.user_event_logs` (Redshift)

**Environment Variables**:
- `TOPIC_NAME`, `DEST_TABLE`, `ENV`, etc.

**Error Handling**:
- Errors logged in CloudWatch, alerts sent to Slack channel `#lambda-errors`

**Owner**:
- Name and team contact

**Last Updated**:
- Date and purpose of last update

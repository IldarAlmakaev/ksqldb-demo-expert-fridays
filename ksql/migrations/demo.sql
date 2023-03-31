CREATE TABLE users(
    id       VARCHAR PRIMARY KEY,
    username VARCHAR,
    userType VARCHAR
) WITH (kafka_topic = 'users.user', value_format = 'AVRO');

CREATE STREAM clickstream (
   id           VARCHAR,
   action       VARCHAR,
   userId       VARCHAR,
   device       VARCHAR,
   insertDate   BIGINT
) WITH (kafka_topic='logging.clicks', value_format='AVRO');

CREATE STREAM clickstream_rekeyed
    WITH (kafka_topic='clicks.rekeyed', value_format='AVRO', PARTITIONS=3, replicas=1) AS
SELECT id,
    action,
    userId,
    IFNULL(EXTRACTJSONFIELD(device, '$.type'), 'N/A') AS "deviceType",
    insertDate
FROM clickstream PARTITION BY userId EMIT CHANGES;

-- Data enrichment. Joining clickstream data with users data
CREATE STREAM IF NOT EXISTS enriched_click_stream
    WITH (KAFKA_TOPIC='enriched_click_stream', VALUE_FORMAT='AVRO') AS
SELECT la.id            AS "id",
       la.action        AS "action",
       la.insertDate    AS "insertDate",
       la."device_type" AS "deviceType",
       u.id,
       AS_VALUE(u.id)   AS "userId",
       u.username       AS "username",
       u.userType       AS "userType"
FROM clickstream_rekeyed AS la
JOIN users AS u ON la.userId = u.id EMIT CHANGES;


-- Create a table over an existing Kafka topic
CREATE TABLE clicks_per_user_device AS
SELECT "deviceType", COUNT(id) AS click_count
FROM clickstream_rekeyed
    WINDOW TUMBLING (SIZE 1 MINUTE)
    GROUP BY "deviceType"
EMIT CHANGES;

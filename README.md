# ksqldb-demo-expert-fridays

## Kafka Connect
* Create source connectors to do Change-Data-Capture using Debezium and produce to Kafka
```shell
 curl -X PUT -H "Content-Type: application/json" -d @connectors/source/mysql-source-logging-v1.json http://localhost:8083/connectors/mysql-source-logging-v1/config
``` 
```shell
curl -X PUT -H "Content-Type: application/json" -d @connectors/source/mysql-source-users-v1.json http://localhost:8083/connectors/mysql-source-users-v1/config 
```
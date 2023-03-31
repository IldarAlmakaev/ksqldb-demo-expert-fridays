# ksqldb-demo

## Prerequisites
* Docker and docker-compose
* For ARM-based arch, use`CONFLUENT_VERSION=7.2.0.arm64` in [.env](.env) file. Otherwise, remove `arm64` suffix if it's not.

## Deployment
* Deploy all services locally:
```shell
docker-compose up -d
```
* When **Kafka Connect** service is started, create source connectors to create Kafka topics with data
```shell
 curl -X PUT -H "Content-Type: application/json" -d @connectors/source/mysql-source-logging-v1.json http://localhost:8083/connectors/mysql-source-logging-v1/config
``` 
```shell
curl -X PUT -H "Content-Type: application/json" -d @connectors/source/mysql-source-users-v1.json http://localhost:8083/connectors/mysql-source-users-v1/config 
```

* Connect to **ksqlDB** using **ksql-cli**
```shell
docker-compose exec ksqldb-cli ksql http://ksqldb:8088
```

* Submit ksql queries one-by-one from the [demo.sql file](./ksql/migrations/demo.sql)
* Inspect ksql entities, e.g. streams `SHOW STREAMS`, topics `SHOW TOPICS`
* Or go to [Web UI for Apache Kafka](http://localhost:8080) service deployed locally and review your topics 
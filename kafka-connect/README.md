```
curl -X POST http://$HOST:8083/connectors \
-H 'Accept:application/json' \
-H 'Content-Type:application/json' \
-d '{
	"name": "debezium-connector",
	"config": {
		"connector.class": "io.debezium.connector.mysql.MySqlConnector",
		"database.hostname": "mysql",
		"database.port": "3306",
		"database.user": "debezium",
		"database.password": "123456",
		"database.server.id": "1000",
		"database.include.list": "dev",
		"table.include.list": "dev.test",
		"message.key.columns": "dev.test:id",
		"topic.prefix": "debezium",
		"schema.history.internal.kafka.bootstrap.servers": "kafka:9092",
		"schema.history.internal.kafka.topic": "schemahistory.debezium",
                "transforms": "unwrap",
                "transforms.unwrap.type": "io.debezium.transforms.ExtractNewRecordState",
                "transforms.unwrap.drop.tombstones": false
	}
}'
```

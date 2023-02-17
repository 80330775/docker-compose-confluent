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
		"database.include.list": "test",
		"table.include.list": "test.test",
		"message.key.columns": "test.test:id",
		"topic.prefix": "debezium",
		"schema.history.internal.kafka.bootstrap.servers": "kafka:9092",
		"schema.history.internal.kafka.topic": "schemahistory.debezium",
                "transforms": "reroute,unwrap",
                "transforms.unwrap.type": "io.debezium.transforms.ExtractNewRecordState",
                "transforms.unwrap.drop.tombstones": false,
                "transforms.reroute.type": "io.debezium.transforms.ByLogicalTableRouter",
                "transforms.reroute.topic.regex": ".*test",
                "transforms.reroute.topic.replacement": "test"
	}
}'

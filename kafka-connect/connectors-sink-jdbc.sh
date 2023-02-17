curl -X POST http://$HOST:8083/connectors \
-H 'Accept:application/json' \
-H 'Content-Type:application/json' \
-d '{
	"name": "jdbc-sink-connector",
	"config": {
          "topics.regex": "test",
		"connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
		"connection.url": "jdbc:mysql://mysql:3306/test",
		"connection.user": "root",
		"connection.password": "123456",
		"insert.mode": "upsert",
		"delete.enabled": true,
		"table.name.format": "${topic}_sink",
		"pk.mode": "record_key",
		"pk.fields": "id",
		"auto.create": false,
		"auto.evolve": false
	}
}'

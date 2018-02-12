#http://cloudurable.com/blog/kafka-avro-schema-registry/index.html
curl -X POST -H "Content-Type:
application/vnd.schemaregistry.v1+json" \
    --data '{"schema": "{\"type\": …}’ \
    http://localhost:8081/subjects/Employee/versions


#Example schema:
{"namespace": "com.cloudurable.phonebook",
  "type": "record",
  "name": "Employee",
  "doc" : "Represents an Employee at a company",
  "fields": [
    {"name": "firstName", "type": "string", "doc": "The persons given name"},
    {"name": "nickName", "type": ["null", "string"], "default" : null},
    {"name": "lastName", "type": "string"},
    {"name": "age",  "type": "int", "default": -1},
    {"name": "emails", "default":[], "type":{"type": "array", "items": "string"}},
    {"name": "phoneNumber",  "type":
    [ "null",
      { "type": "record",   "name": "PhoneNumber",
        "fields": [
          {"name": "areaCode", "type": "string"},
          {"name": "countryCode", "type": "string", "default" : ""},
          {"name": "prefix", "type": "string"},
          {"name": "number", "type": "string"}
        ]
      }
    ]
    },
    {"name":"status", "default" :"SALARY", "type": { "type": "enum", "name": "Status",
      "symbols" : ["RETIRED", "SALARY", "HOURLY", "PART_TIME"]}
    }
  ]
}

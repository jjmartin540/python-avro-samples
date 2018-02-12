from confluent_kafka import avro
from confluent_kafka.avro import AvroProducer

value_schema = avro.load('ValueSchema.avsc')
key_schema = avro.load('KeySchema.avsc')
value = {"name": "Value"}
key = {"name": "Key"}

avroProducer = AvroProducer({'bootstrap.servers': 'mybroker,mybroker2', 'schema.registry.url': 'http://schem_registry_host:port'}, default_key_schema=key_schema, default_value_schema=value_schema)
avroProducer.produce(topic='my_topic', value=value, key=key)
avroProducer.flush()

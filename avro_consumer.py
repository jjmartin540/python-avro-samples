from confluent_kafka import KafkaError
from confluent_kafka.avro import AvroConsumer
from confluent_kafka.avro.serializer import SerializerError

default_registry = "http://schema-registry:8081"
default_kafka_brokers = "kafka"
default_group_id = "test"
registry = os.getenv('SCHEMA_REGISTRY', default_registry)
broker_list = os.getenv('KAFKA',default_kafka_brokers)
group_id = os.getenv('GROUP_ID', default_group_id ) #original default was 'groupid'

#is the group_id the schema id? not clear
c = AvroConsumer({'bootstrap.servers': broker_list, 'group.id': group_id, 'schema.registry.url': registry})
c.subscribe(['my_topic'])
running = True
while running:
    try:
        msg = c.poll(10)
        if msg:
            if not msg.error():
                print(msg.value())
            elif msg.error().code() != KafkaError._PARTITION_EOF:
                print(msg.error())
                running = False
    except SerializerError as e:
        print("Message deserialization failed for %s: %s" % (msg, e))
        running = False

c.close()

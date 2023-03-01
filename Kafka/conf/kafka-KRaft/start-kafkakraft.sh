#!/bin/bash -e

KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)" && \
"/kafka/bin/kafka-storage.sh" format -t $KAFKA_CLUSTER_ID -c "/kafka/config/kraft/server.properties" && \
"/kafka/bin/kafka-server-start.sh" "/kafka/config/kraft/server.properties"

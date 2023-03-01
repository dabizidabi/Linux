```
#Build kafka image
docker build -t kafka:3.4 .

#Build kafka-zookeeper image
docker build -t zookeeper:3.4 -f conf/zookeeper/Dockerfile conf/zookeeper/

#Build kafka image with KRaft
docker build -t kafkakraft:3.4 -f conf/kafka-KRaft/Dockerfile conf/kafka-KRaft/

```

```
#Create network
docker network create kafka

#start images:

docker run -d --rm --name zookeeper-1 --net kafka \
-v ${PWD}/conf/zookeeper/zookeeper.properties:/kafka/config/zookeeper.properties \
zookeeper:3.4

#Change N to 1, 2, 3...
docker run -d --rm --name kafka-(N) --net kafka \
-v ${PWD}/conf/kafka-(N)/server.properties:/kafka/config/server.properties \
kafka:3.4

docker logs zookeeper-1
```

```
Create topic
/kafka/bin/kafka-topics.sh \
--create \
--bootstrap-server kafka-1:9092 \
--replication-factor 1 \
--partitions 3 \
--topic Tests

Describe topic
/kafka/bin/kafka-topics.sh \
--describe \
--topic Tests \
--bootstrap-server kafka-1:9092
```

```
#Build kafka image
docker build -t kafka:3.4 .

#Build kafka-zookeeper image
docker build -t zookeeper:3.4 -f conf/zookeeper/Dockerfile conf/zookeeper/

#Build kafka image with KRaft
docker build -t kafkakraft:3.4 -f conf/kafka-KRaft/Dockerfile conf/kafka-KRaft

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

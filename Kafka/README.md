```
#Build kafka image
docker build -t kafka:3.4 .

#Build kafka-zookeeper image
docker build -t zookeeper:3.4 -f conf/zookeeper/Dockerfile conf/zookeeper/

#Build kafka image with KRaft
docker build -t kafkakraft:3.4 -f conf/kafka-KRaft/Dockerfile conf/kafka-KRaft
```

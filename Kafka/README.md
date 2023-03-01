docker build -t kafka:3.4  .   #Build kafka image
docker build -t zookeeper:3.4 -f DockerfileZookeeper . #Build kafka-zookeeper image
docker build -t kafkaKraft:3.4 -f DockerfileKRaft . #Build kafka image with KRaft


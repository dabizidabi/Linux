FROM amazoncorretto:19.0.2

ENV KAFKA_VERSION=3.4.0
ENV SCALA_VERSION=2.13

RUN yum install -y tar gzip && \
    yum clean all

RUN mkdir /tmp/kafka && \
    curl "https://downloads.apache.org/kafka/3.4.0/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" \
    -o /tmp/kafka/kafka.tgz && ls -la /tmp

RUN mkdir /kafka && cd /kafka && \
    tar -zxvf /tmp/kafka/kafka.tgz --strip 1

RUN groupadd -r kafka && \
    useradd -r -g kafka -d /kafka -s /sbin/nologin && \
    chown -R kafka:kafka /kafka

USER kafka
WORKDIR /kafka

CMD ["bin/kafka-server-start.sh", "config/server.properties"]

ARG image
FROM ${image}

## Install connectors
ENV DEBEZIUM_VERSION=1.8.1.Final
RUN set -ex \
    && wget -q https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/${DEBEZIUM_VERSION}/debezium-connector-mysql-${DEBEZIUM_VERSION}-plugin.tar.gz \
        -O /tmp/debezium-connector-mysql-${DEBEZIUM_VERSION}-plugin.tar.gz \
    && tar xzvf /tmp/debezium-connector-mysql-${DEBEZIUM_VERSION}-plugin.tar.gz -C /usr/share/java/


# Dbzm's message filtering feature
RUN set -ex; \
    \
    wget https://repo1.maven.org/maven2/io/debezium/debezium-scripting/${DEBEZIUM_VERSION}/debezium-scripting-${DEBEZIUM_VERSION}.tar.gz -O /tmp/debezium-scripting-${DEBEZIUM_VERSION}-plugin.tar.gz; \
    tar xzvf /tmp/debezium-scripting-${DEBEZIUM_VERSION}-plugin.tar.gz -C /usr/share/java/debezium-connector-mysql ; \
    wget -q https://repo1.maven.org/maven2/org/codehaus/groovy/groovy/3.0.9/groovy-3.0.9.jar -O /usr/share/java/debezium-connector-mysql/groovy-3.0.9.jar; \
    wget -q https://repo1.maven.org/maven2/org/codehaus/groovy/groovy-jsr223/3.0.9/groovy-jsr223-3.0.9.jar -O /usr/share/java/debezium-connector-mysql/groovy-jsr223-3.0.9.jar

# JSON Layout logging dependencies
RUN set -ex; \
    \
    wget -q https://repo1.maven.org/maven2/commons-lang/commons-lang/2.6/commons-lang-2.6.jar -O /etc/kafka-connect/jars/commons-lang-2.6.jar; \
    wget -q https://repo1.maven.org/maven2/net/minidev/json-smart/1.1.1/json-smart-1.1.1.jar -O /etc/kafka-connect/jars/json-smart-1.1.1.jar; \
    wget -q https://repo1.maven.org/maven2/net/logstash/log4j/jsonevent-layout/1.7/jsonevent-layout-1.7.jar -O /etc/kafka-connect/jars/jsonevent-layout-1.7.jar
FROM ubuntu
MAINTAINER Kris Pearson <kpearson@dataxu.com>
RUN apt-get update
RUN apt-get install -y openjdk-7-jre-headless wget
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
RUN (cd /tmp && wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.1.tar.gz -O elasticsearch.tar.gz && tar xf elasticsearch.tar.gz && mv elasticsearch-* /opt/elasticsearch)
RUN rm -rf /tmp/*

EXPOSE 9200
EXPOSE 9300
VOLUME /opt/elasticsearch/data
ENTRYPOINT ["/opt/elasticsearch/bin/elasticsearch"]
CMD []

FROM docker.elastic.co/elasticsearch/elasticsearch:7.17.16
RUN elasticsearch-plugin install analysis-nori

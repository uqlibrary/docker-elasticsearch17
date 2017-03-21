# docker-elasticsearch17
Container for older elasticsearch 1.7 node

For serious use it would be wise to volume mount a custom config to /etc/elasticsearch/elasticsearch.yml and also mount a data volume to /var/lib/elasticsearch

Once the container is running you can do index setup using wither of these admin gui plugins:

HQ
http://CONTAINER:9200/_plugin/HQ/

or

HQ
http://CONTAINER:9200/_plugin/head/

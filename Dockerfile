FROM uqlibrary/docker-base:12

MAINTAINER Dan Callan <d.callan@library.uq.edu.au>

COPY elasticsearch17.repo /etc/yum.repos.d/elasticsearch17.repo
COPY entrypoint.sh /opt/entrypoint.sh

RUN \
  rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch && \
  yum install -y java-1.7.0-openjdk elasticsearch && \
  chmod +x /opt/entrypoint.sh

EXPOSE 9200 9300

ENTRYPOINT ["/opt/entrypoint.sh"]

#!/bin/sh

# Sets the default values for elasticsearch variables used in this script
ES_USER="elasticsearch"
ES_GROUP="elasticsearch"
ES_HOME="/usr/share/elasticsearch"
MAX_OPEN_FILES=65535
MAX_MAP_COUNT=262144
LOG_DIR="/var/log/elasticsearch"
DATA_DIR="/var/lib/elasticsearch"
WORK_DIR="/tmp/elasticsearch"
CONF_DIR="/etc/elasticsearch"
CONF_FILE="/etc/elasticsearch/elasticsearch.yml"

export ES_HEAP_SIZE
export ES_HEAP_NEWSIZE
export ES_DIRECT_SIZE
export ES_JAVA_OPTS
export JAVA_HOME

ulimit -n $MAX_OPEN_FILES
sysctl -q -w vm.max_map_count=$MAX_MAP_COUNT

mkdir -p "$WORK_DIR"
chown "$ES_USER":"$ES_GROUP" "$WORK_DIR"

echo "Starting Elasticsearch in foreground:"
$ES_HOME/bin/elasticsearch -Des.default.path.home=$ES_HOME -Des.default.path.logs=$LOG_DIR -Des.default.path.data=$DATA_DIR -Des.default.path.work=$WORK_DIR -Des.default.path.conf=$CONF_DIR

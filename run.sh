#!/bin/bash
export NODE_NAME=${NODE_NAME:-${HOSTNAME}}
export NODE_MASTER=${NODE_MASTER:-true}
export NODE_DATA=${NODE_DATA:-true}
export HTTP_PORT=${HTTP_PORT:-9200}
export TRANSPORT_PORT=${TRANSPORT_PORT:-9300}
export MINIMUM_MASTER_NODES=${MINIMUM_MASTER_NODES:-2}

ls -ld config/
ls -l config/
sysctl -w vm.max_map_count=262144
./bin/elasticsearch_logging_discovery >> ./config/elasticsearch.yml
echo elasticsearch.yml:
cat config/elasticsearch.yml
echo '\njvm.options':
cat config/jvm.options
echo '\nlog42.properties':
cat config/log4j2.properties
su - elasticsearch
exec ./bin/es-docker

#!/bin/bash
sysctl -w vm.max_map_count=262144
./bin/elasticsearch_logging_discovery >> ./config/elasticsearch.yml
su - elasticsearch
exec ./bin/es-docker

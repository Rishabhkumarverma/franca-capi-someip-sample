#!/usr/bin/env bash

sudo route add -net 224.0.0.0/4 dev eth0
VSOMEIP_PATH=/usr/local
export LD_LIBRARY_PATH=${VSOMEIP_PATH}/lib:$LD_LIBRARY_PATH
export VSOMEIP_APPLICATION_NAME=routingmanagerd
export VSOMEIP_CONFIGURATION=../config/vsomeip-service.json
routingmanagerd -d

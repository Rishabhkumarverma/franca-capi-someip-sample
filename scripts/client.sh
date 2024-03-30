#!/usr/bin/env bash

sudo route add -net 224.0.0.0/4 dev eth0
COMMONAPI_PATH=/usr/local/lib
COMMONAPI_SOMEIP_PATH=/usr/local/lib
VSOMEIP_PATH=/usr/local/lib
export LD_LIBRARY_PATH=../lib:${COMMONAPI_PATH}:${COMMONAPI_SOMEIP_PATH}:${VSOMEIP_PATH}:$LD_LIBRARY_PATH
export VSOMEIP_APPLICATION_NAME=client-sample
export VSOMEIP_CONFIGURATION=../config/vsomeip-client.json
export COMMONAPI_CONFIG=../config/commonapi.ini
../bin/MLClient

#!/bin/bash

docker run --privileged -t -i --rm --network=someip_eth -v $PWD:/workspace -w /workspace -it someip_test:latest  bash
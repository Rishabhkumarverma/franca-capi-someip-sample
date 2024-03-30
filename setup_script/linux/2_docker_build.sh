#!/bin/bash

docker buildx build --network=host -t someip_test:latest . 
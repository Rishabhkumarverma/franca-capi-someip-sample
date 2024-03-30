#!/bin/bash

COMMON_API_CORE_GENERATOR=https://github.com/COVESA/capicxx-core-tools/releases/download/3.2.14/commonapi_core_generator.zip
COMMON_API_SOMEIP_GENERATOR=https://github.com/COVESA/capicxx-someip-tools/releases/download/3.2.14/commonapi_someip_generator.zip
CAPICXX_CORE_RUNTIME=https://github.com/COVESA/capicxx-core-runtime.git
CAPICXX_SOMEIP_RUNTIME=https://github.com/COVESA/capicxx-someip-runtime.git
VSOMEIP=https://github.com/COVESA/vsomeip.git
GOOGLETEST=https://github.com/google/googletest.git
PACKAGEDIR=./package1
mkdir $PACKAGEDIR
cd $PACKAGEDIR
echo "Download the COMMON_API_CORE_GENERATOR"
wget $COMMON_API_CORE_GENERATOR

echo "Download the COMMON_API_SOMEIP_GENERATOR"
wget $COMMON_API_SOMEIP_GENERATOR

mkdir ./commonapi_core_generator && cd ./commonapi_core_generator && unzip ../commonapi_core_generator.zip && cd ../
mkdir ./commonapi_someip_generator && cd ./commonapi_someip_generator && unzip ../commonapi_someip_generator.zip && cd ../

echo "Clone the CAPICXX_CORE_RUNTIME"
git clone $CAPICXX_CORE_RUNTIME

echo "Clone the CAPICXX_SOMEIP_RUNTIME"
git clone $CAPICXX_SOMEIP_RUNTIME

echo "Clone the VSOMEIP"
git clone $VSOMEIP

echo "Clone the GOOGLETEST"
git clone $GOOGLETEST
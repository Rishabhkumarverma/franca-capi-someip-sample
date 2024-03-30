#!/bin/bash

GENERATOR_TAG="3.2.14"
CORE_RUNTIME_TAG="3.2.3-r7"
SOMEIP_RUNTIME_TAG="3.2.3-r8"
VSOMEIP_TAG="3.4.10"
GOOGLETEST_TAG="1.14.0"

COMMON_API_CORE_GENERATOR=https://github.com/COVESA/capicxx-core-tools/releases/download/$GENERATOR_TAG/commonapi_core_generator.zip
COMMON_API_SOMEIP_GENERATOR=https://github.com/COVESA/capicxx-someip-tools/releases/download/$GENERATOR_TAG/commonapi_someip_generator.zip
CAPICXX_CORE_RUNTIME=https://github.com/COVESA/capicxx-core-runtime/archive/refs/tags/$CORE_RUNTIME_TAG.zip
CAPICXX_SOMEIP_RUNTIME=https://github.com/COVESA/capicxx-someip-runtime/archive/refs/tags/$SOMEIP_RUNTIME_TAG.zip
VSOMEIP=https://github.com/COVESA/vsomeip/archive/refs/tags/$VSOMEIP_TAG.zip
GOOGLETEST=https://github.com/google/googletest/archive/refs/tags/v$GOOGLETEST_TAG.zip

PACKAGEDIR=./package

mkdir $PACKAGEDIR
cd $PACKAGEDIR
echo "Download the COMMON_API_CORE_GENERATOR"
wget $COMMON_API_CORE_GENERATOR

echo "Download the COMMON_API_SOMEIP_GENERATOR"
wget $COMMON_API_SOMEIP_GENERATOR

echo "Download the CAPICXX_CORE_RUNTIME"
wget $CAPICXX_CORE_RUNTIME -O capicxx-core-runtime_$CORE_RUNTIME_TAG.zip

echo "Download the CAPICXX_SOMEIP_RUNTIME"
wget $CAPICXX_SOMEIP_RUNTIME -O capicxx-someip-runtime_$SOMEIP_RUNTIME_TAG.zip

echo "Download the VSOMEIP"
wget $VSOMEIP -O vsomeip_$VSOMEIP_TAG.zip

echo "Download the GOOGLETEST"
wget $GOOGLETEST -O googletest_$GOOGLETEST_TAG.zip

unzip ./commonapi_core_generator.zip  -d ./commonapi_core_generator
unzip ./commonapi_someip_generator.zip -d ./commonapi_someip_generator
unzip ./capicxx-core-runtime_$CORE_RUNTIME_TAG.zip  && mv ./capicxx-core-runtime-$CORE_RUNTIME_TAG ./capicxx-core-runtime
unzip ./capicxx-someip-runtime_$SOMEIP_RUNTIME_TAG.zip  && mv ./capicxx-someip-runtime-$SOMEIP_RUNTIME_TAG ./capicxx-someip-runtime
unzip ./vsomeip_$VSOMEIP_TAG.zip  && mv ./vsomeip-$VSOMEIP_TAG ./vsomeip
unzip ./googletest_$GOOGLETEST_TAG.zip  && mv ./googletest-$GOOGLETEST_TAG ./googletest
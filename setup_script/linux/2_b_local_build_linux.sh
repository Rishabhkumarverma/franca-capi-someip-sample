#!/bin/bash
CRTDIR=$PWD
cp -r $CRTDIR/package/commonapi_core_generator /usr/local
cp -r $CRTDIR/package/commonapi_someip_generator /usr/local

echo "Building capicxx-core-runtime"
cd $CRTDIR/package/capicxx-core-runtime && mkdir build && cd build && cmake -D CMAKE_INSTALL_PREFIX=/usr/local .. && make -j8 && make install
echo "Building googletest"
cd $CRTDIR/package/googletest && mkdir build && cd build && cmake -D CMAKE_INSTALL_PREFIX=/usr/local .. && make -j8 && make install
echo "Building vsomeip"
cd $CRTDIR/package/vsomeip && mkdir build && cd build && cmake -D CMAKE_INSTALL_PREFIX=/usr/local .. && make -j8 && make install
cp $CRTDIR/package/vsomeip/build/examples/routingmanagerd/routingmanagerd /usr/bin
echo "Building capicxx-someip-runtime"
cd $CRTDIR/package/capicxx-someip-runtime && mkdir build && cd build && cmake -D CMAKE_INSTALL_PREFIX=/usr/local .. && make -j8 && make install

FROM ubuntu:22.04
ENV TZ=Asia/Kolkata \
    DEBIAN_FRONTEND=noninteractive
ENV https_proxy=http://127.0.0.1:3128
ENV http_proxy=http://127.0.0.1:3128
ENV HTTP_PROXY=http://127.0.0.1:3128
ENV HTTPS_PROXY=http://127.0.0.1:3128
RUN apt-get update
RUN apt-get install build-essential -y
RUN apt-get install cmake -y
RUN apt-get update && apt-get -y install sudo
RUN useradd -m bt_wifi && echo "ubuntu:ubuntu" | chpasswd && adduser bt_wifi sudo
RUN apt-get install systemctl -y
RUN apt-get install -y iproute2 net-tools firewalld
RUN apt-get install -y libboost-all-dev 
RUN apt-get install -y asciidoc 
RUN apt-get install  -y source-highlight  
RUN apt-get install  -y doxygen
RUN apt-get install  -y graphviz
RUN apt install -y default-jre
RUN apt-get install -y maven
COPY ./package /package
RUN cd /package/

RUN cd /package/capicxx-core-runtime && mkdir build && cd build && cmake -D CMAKE_INSTALL_PREFIX=/usr/local .. && make -j8 && make install
RUN cd /package/googletest && mkdir build && cd build && cmake -D CMAKE_INSTALL_PREFIX=/usr/local .. && make -j8 && make install
RUN cd /package/vsomeip && mkdir build && cd build && cmake -D CMAKE_INSTALL_PREFIX=/usr/local .. && make -j8 && make install
RUN cp /package/vsomeip/build/examples/routingmanagerd/routingmanagerd /usr/bin
RUN cd /package/capicxx-someip-runtime && mkdir build && cd build && cmake -D CMAKE_INSTALL_PREFIX=/usr/local .. && make -j8 && make install
COPY entry_point.sh /entry_point.sh

FROM ubuntu:22.04
ENV TZ=Asia/Kolkata \
    DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get update && apt-get -y install sudo
RUN useradd -m ubuntu && echo "ubuntu:ubuntu" | chpasswd && adduser ubuntu sudo
COPY 2_a_local_install_dep_linux.sh /tmp/2_a_local_install_dep_linux.sh
RUN sh /tmp/2_a_local_install_dep_linux.sh
COPY ./package /package
COPY 2_b_local_build_linux.sh /tmp/2_b_local_build_linux.sh
RUN sh /tmp/2_b_local_build_linux.sh
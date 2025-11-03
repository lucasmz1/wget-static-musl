#!/bin/bash

##install some dependencies
sudo apt -y install wget curl strip

##download alpine rootfs
wget -c "https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/x86_64/alpine-minirootfs-3.22.2-x86_64.tar.gz"

##extract rootfs
tar xf alpine-minirootfs-3.22.2-x86_64.tar.gz -C pasta/

##copy resolv.conf into the folder
cp /etc/resolv.conf ./pasta/etc/

##if fails in cat command add inside chroot line this command "cat src/css_.c >> src/css.c"

##mount, bind and chroot into dir
sudo mount -t proc none ./pasta/proc/
sudo mount --rbind /dev ./pasta/dev/
sudo mount --rbind /sys ./pasta/sys/
sudo chroot ./pasta/ /bin/sh -c "apk update && apk add build-base \
musl-dev \
openssl-dev \
zlib-dev \
libidn2-dev \
libpsl-dev \
libuuid \
curl \
gawk \
libpsl-dev\
libidn2-static \
openssl-libs-static \
zlib-static \
libpsl-static \
flex \
bison \
libunistring-dev \
libunistring-static \
perl && curl -C - -L -O https://mirror.marwan.ma/gnu/wget/wget-1.25.0.tar.gz && tar xf wget-1.25.0.tar.gz && cd wget-1.25.0/ \
./configure CC=gcc --with-ssl=openssl LDFLAGS="-static -lidn2 -lunistring" PERL=/usr/bin/perl && make && exit"
mkdir dist
cp ./pasta/wget-1.25.0/src/wget dist/
cd dist/
strip wget
tar -cJf wget.tar.xz wget

#!/bin/bash

# update && install packages
yum -y update
yum install -y gcc wget gcc-c++ pcre pcre-devel zlib zlib-devel openssl openssl-devel libxml2 libxml2-devel curl curl-devel

# install mcrypt
if [ ! -f ./libmcrypt-2.5.8.tar.gz ]; then
    wget https://nchc.dl.sourceforge.net/project/mcrypt/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.gz
    tar -xf ./libmcrypt-2.5.8.tar.gz
fi
cd ./libmcrypt-2.5.8
./configure
make
make install

# install php
cd /opt
if [ ! -f ./php-7.1.10.tar.gz ]; then
    wget -O php-7.1.10.tar.gz http://cn2.php.net/get/php-7.1.10.tar.gz/from/this/mirror
    tar -xf ./php-7.1.10.tar.gz
fi
cd ./php-7.1.10
# 编译参数
./configure --prefix=/usr/local/php --enable-fpm --enable-mbstring --with-curl --enable-sockets --with-openssl --with-libxml-dir --with-mcrypt --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --enable-pcntl --enable-maintainer-zts --with-zlib --enable-zip --with-mhash --with-mcrypt --enable-inline-optimization
# 编译
make
make install

# change config




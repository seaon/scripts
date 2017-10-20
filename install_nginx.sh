#!/bin/bash

# update && install packages
yum -y update
yum install -y gcc wget gcc-c++ pcre pcre-devel zlib zlib-devel openssl openssl-devel

# install nginx
cd /opt
wget http://nginx.org/download/nginx-1.12.2.tar.gz
tar -xf ./nginx-1.12.2.tar.gz
cd ./nginx-1.12.2
./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module
make
make install

# change config
mkdir /usr/local/nginx/conf/conf.d



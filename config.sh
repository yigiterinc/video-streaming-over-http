#!/bin/bash

cd $HOME..
git clone https://github.com/arut/nginx-ts-module.git
wget https://nginx.org/download/nginx-1.13.8.tar.gz  ⋅⋅
git clone https://github.com/sergey-dryabzhinsky/nginx-rtmp-module.git
sudo apt-get install build-essential libpcre3 libpcre3-dev libssl-dev
tar -xf nginx-1.13.8.tar.gz 
cd nginx-1.13.8/
sudo apt update
sudo apt install autoconf automake build-essential libpcre3 libpcre3-dev libssl-dev
sudo apt-get install zlib1g-dev
./configure --with-http_ssl_module --add-module=../nginx-rtmp-module --with-http_stub_status_module --add-module=../nginx-ts-module
make
sudo make install

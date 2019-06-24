#!/usr/bin/env bash 
#
# Instala nginx (código fonte)
#

export LUAJIT_LIB=/usr/local/lib
export LUAJIT_INC=/usr/local/include/luajit-2.0

cd ~/Downloads/

#wget http://nginx.org/download/nginx-1.10.1.tar.gz
#tar -zxvf nginx-1.10.1.tar.gz

cd nginx-1.10.1/
./configure \
    --prefix=/usr/local \
    --conf-path=/etc/nginx/nginx.conf \
    --pid-path=/usr/local/nginx/nginx.pid \
    --with-stream                         \
    --with-http_ssl_module                \
    --with-http_v2_module                 \
    --with-openssl=/root/Downloads/openssl-1.0.2k \
    --add-module=/root/Downloads/ngx_devel_kit-0.3.0  \
    --add-module=/root/Downloads/lua-nginx-module-0.10.8

#make
#sudo make install

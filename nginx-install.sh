#!/usr/bin/env bash 
#
# Instala nginx (código fonte)
#

#Downloads
#wget http://luajit.org/download/LuaJIT-2.0.5.tar.gz
#wget http://nginx.org/download/nginx-1.16.0.tar.gz

#LuaJIT
#make && make install

#export LUAJIT_LIB=/usr/local/lib
#export LUAJIT_INC=/usr/local/include/luajit-2.1


#tar -zxvf nginx-1.10.1.tar.gz

#cd nginx-1.10.1/
./configure \
    --prefix=/usr/local \
    --conf-path=/etc/nginx/nginx.conf \
    --pid-path=/usr/local/nginx/nginx.pid \
    --with-stream                         \
    --with-http_ssl_module                \
    --with-http_v2_module
#    --with-ld-opt="-Wl,-rpath,$LUAJIT_LIB" \
#    --with-openssl=/dados/Downloads/openssl-1.0.2k

#make
#sudo make install

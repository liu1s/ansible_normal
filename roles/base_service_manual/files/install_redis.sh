#!/bin/sh
if [ -z $1 ];then
    echo "please enter the download source path"
    exit
fi

if [ -f /usr/local/redis/bin/redis-server ];then
    exit
fi

cd $1
if [ ! -f "redis-3.0.4.tar.gz" ];then
    wget http://download.redis.io/releases/redis-3.0.4.tar.gz
fi

#tar
if [ ! -d "redis-3.0.4" ];then
    tar zvxf redis-3.0.4.tar.gz
fi

cd redis-3.0.4

make PREFIX=/usr/local/redis install > install.log
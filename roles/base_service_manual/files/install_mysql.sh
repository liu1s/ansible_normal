#!/bin/sh
if [ -z $1 ];then
    echo "please enter the download source path"
    exit
fi

if [ -f /usr/local/mysql/bin/mysql ];then
    exit
fi

cd $1
if [ ! -f "mysql-5.5.45.tar.gz" ];then
    wget http://mirrors.sohu.com/mysql/MySQL-5.5/mysql-5.5.45.tar.gz
fi

#tar
if [ ! -d "mysql-5.5.45" ];then
    tar zvxf mysql-5.5.45.tar.gz
fi

cd mysql-5.5.45

#configure mysql
cmake -DCMAKE_INSTALL_PREFIX=/usr/local/mysql > cmake.log;
#if make fail, rm CMakeCache.txt
make && make install > make.log;
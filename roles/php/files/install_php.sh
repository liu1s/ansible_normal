#!/bin/sh
if [ -z $1 ];then
    echo "please enter the download source path"
    exit
fi


if [ -f /usr/local/php/bin/php ];then
    exit
fi

cd $1
if [ ! -f "php-5.6.13.tar.gz" ];then
    wget http://cn2.php.net/distributions/php-5.6.13.tar.gz
fi

#tar
if [ ! -d "php-5.6.13" ];then
    tar zvxf php-5.6.13.tar.gz
fi

cd php-5.6.13

#configure php
./configure --prefix=/usr/local/php --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --enable-mbregex --enable-fpm --with-fpm-user=nobody --with-fpm-group=nobody --enable-mbstring --with-mcrypt --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-libdir=lib64

make && make install;

run_result=$?
if [ $run_result -ne 0 ];then
    exit $run_result
fi


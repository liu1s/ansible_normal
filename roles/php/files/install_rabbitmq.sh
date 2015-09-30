#!/bin/sh
if [ -z $1 ];then
    echo "please enter the download source path"
    exit
fi

if [ -f /usr/local/include/amqp.h ];then
    exit
fi

cd $1
if [ ! -f "rabbitmq-c-0.5.2.tar.gz" ];then
    wget https://github.com/alanxz/rabbitmq-c/releases/download/v0.5.2/rabbitmq-c-0.5.2.tar.gz
fi

#tar
if [ ! -d "rabbitmq-c-0.5.2" ];then
    tar zvxf rabbitmq-c-0.5.2.tar.gz
fi

cd rabbitmq-c-0.5.2


#if [ ! -d "rabbitmq-c" ];then
#    git clone git://github.com/alanxz/rabbitmq-c.git;
#fi

#cd rabbitmq-c
#git submodule init;
#git submodule update;

autoreconf -i && ./configure;make && make install;

run_result=$?
if [ $run_result -ne 0 ];then
    exit $run_result
fi
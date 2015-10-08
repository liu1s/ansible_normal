#!/bin/sh
if [ -z $1 ];then
    echo "please enter the download source path"
    exit
fi

cd $1

#tar
if [ ! -d "cphalcon" ];then
    git clone git://github.com/phalcon/cphalcon.git
fi

cd cphalcon/build

if [ -f has_success_install ];then
    exit 0
fi

./install
run_result=$?
if [ $run_result -ne 0 ];then
    exit $run_result
fi

touch has_success_install
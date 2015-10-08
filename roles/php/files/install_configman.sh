#!/bin/sh
if [ -z $1 ];then
    echo "please enter the download source path"
    exit
fi

cd $1

#tar
if [ ! -d "configman_php_extension" ];then
    git clone https://github.com/wchswchs/configman_php_extension
fi

cd configman_php_extension

if [ -f has_success_install ];then
    exit 0
fi

#configure php
/usr/local/php/bin/phpize && ./configure --with-php-config=/usr/local/php/bin/php-config && make && make install;

run_result=$?
if [ $run_result -ne 0 ];then
    exit $run_result
fi

touch has_success_install

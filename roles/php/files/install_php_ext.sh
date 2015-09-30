#!/bin/sh
#$1 download path
#$2 download file name

#conifgman exec install configman shell
shell_path=$(dirname $0)
if [ $2 = "configman" ];then
    exec $shell_path/install_configman.sh $1
elif [ $2 = "phalcon" ];then
    exec $shell_path/install_phalcon.sh $1
fi

if [ -z $1 ];then
    echo "please enter the download source path"
    exit
fi

cd $1
if [ ! -f "$2.tgz" ];then
    wget http://pecl.php.net/get/$2.tgz
fi

#tar
if [ ! -d "$2" ];then
    tar zvxf "$2.tgz"
fi

cd $2

configure_option=''
grep_result=`echo $2 | grep memcached`
if [ "$grep_result" != "" ];then
    configure_option="--disable-memcached-sasl"
fi

grep_result=`echo $2 | grep xhprof`
if [ "$grep_result" != "" ];then
    cd extension
fi

#configure php ext
/usr/local/php/bin/phpize && ./configure --with-php-config=/usr/local/php/bin/php-config $configure_option

run_result=$?
if [ $run_result -ne 0 ];then
    exit $run_result
fi

make && make install;

run_result=$?
if [ $run_result -ne 0 ];then
    exit $run_result
fi    


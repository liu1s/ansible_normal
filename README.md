# ansible_normal
最近在mac上安装一些分布式服务时，经常会遇到不能安装或者安装之后不能启动的问题，所以还是需要在安装linux虚拟机。正好整理下以前ansible安装的一些东西。

# 前提
1. 安装ansible
2. 目标机器开启sshd
3. 测试机器系统 ubuntu 14.04.3 LTS

# 提示
1. 本安装包大部分安装都是已root用户安装
2. tasks中common一定要安装

# tasks列表
1. common 一些常用的配置和包安装
2. user 用户创建相关
3. base_service 一些常用http服务的安装，apt安装，例如nginx，memcached
4. base_service_manual 一些常用http服务的安装，编译安装，例如redis，mysql

# 安装
1. 修改group_vars里面变量设置
2. 安装common ansible-playbook common.yml -i hosts -K
3. 安装users
4. 安装其他

# 参考
ansible-playbook common.yml -i hosts -K
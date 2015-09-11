#!/usr/bin/env bash
#**********************************
#Author:Steven_Shen
#Email:syj54540@hotmail.com
#源码自动化编译安装Python3.4
#平台测试
#CentOS-7-x86_64-1503	*PASS*
#**********************************

#官网Python源码下载地址 .xz 格式文件
DOWNLOAD_LINK=https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tar.xz

PYTHON_SRC_NAME=$(echo ${DOWNLOAD_LINK} | rev | cut -d/ -f1 | rev)
PYTHON_DIR=$(echo ${PYTHON_SRC_NAME} | rev | cut -d. -f3- | rev)

#安装依赖库
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel scl-utils

cd /usr/local/src/
curl -O ${DOWNLOAD_LINK}
tar -Jxvf ${PYTHON_SRC_NAME}
cd /usr/local/src/${PYTHON_DIR}
./configure --prefix=/usr/local --enable-shared
make && make altinstall
echo "/usr/local/lib" >> /etc/ld.so.conf.d/local.conf
ldconfig

#清理依赖库
#yum -y remove  zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel

reboot

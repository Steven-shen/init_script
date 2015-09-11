#!/usr/bin/env bash
#**********************************
#Author:Steven_Shen
#Email:syj54540@hotmail.com
#CentOS-7-x86_64-1503	*PASS*
#**********************************

systemctl set-default multi-user.target
setenforce 0
sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
systemctl disable firewalld.service
yum -y update
reboot

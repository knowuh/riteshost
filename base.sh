#!/usr/bin/env bash
cd ~/rites_host
source setpaths.sh

#######################################
# setup yum repos
#######################################
sudo setenforce 0
sudo rpm -Uvh http://download.fedora.redhat.com/pub/epel/5/i386/epel-release-5-3.noarch.rpm
sudo rpm -Uvh http://download.elff.bravenet.com/5/i386/elff-release-5-3.noarch.rpm
sudo yum makecache

#######################################
# install basic tools
#######################################
sudo yum install -y gcc curl-devel libxslt-devel expat-devel sqlite-devel readline-devel libtermcap-devel libxml2-devel
sudo yum install -y bison autoconf asciidoc xmlto --enablerepo=rpmforge

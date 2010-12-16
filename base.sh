#!/usr/bin/env bash
source setpaths.sh
RPM_DIR=$BASE_DIR/local_rpms
#######################################
# setup yum repos
#######################################
sudo setenforce 0
mkdir -p $RPM_DIR
cd $RPM_DIR
wget http://download.elff.bravenet.com/5/i386/elff-release-5-3.noarch.rpm
sudo rpm -Uvh elff-release-5-3.noarch.rpm

wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.1-1.el5.rf.i386.rpm
sudo rpm -Uvh rpmforge-release-0.5.1-1.el5.rf.i386.rpm
sudo yum makecache

#######################################
# install basic tools
#######################################
sudo yum install -y gcc curl-devel libxslt-devel expat-devel sqlite-devel readline-devel libtermcap-devel libxml2-devel
sudo yum install -y bison autoconf asciidoc xmlto --enablerepo=rpmforge
sudo yum install -y subversion

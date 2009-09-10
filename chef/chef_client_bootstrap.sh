#!/bin/env bash
cd
sudo setenforce 0
sudo yum remove httpd
sudo rpm -Uvh http://download.fedora.redhat.com/pub/epel/5/i386/epel-release-5-3.noarch.rpm
sudo rpm -Uvh http://download.elff.bravenet.com/5/i386/elff-release-5-3.noarch.rpm
sudo yum makecache
sudo yum install gcc curl-devel libxslt-devel expat-devel sqlite-devel readline-devel libtermcap-devel libxml2-devel
sudo yum install bison autoconf asciidoc xmlto --enablerepo=rpmforge
sudo yum install rubygem-chef ruby
sudo -E chef-solo -c ~/solo.rb -j ~/chef-client.json -r http://s3.amazonaws.com/chef-solo/bootstrap-0.7.8.tar.gz


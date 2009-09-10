#!/bin/env bash
cd ~
sudo setenforce 0
sudo yum remove httpd
sudo rpm -Uvh http://download.fedora.redhat.com/pub/epel/5/i386/epel-release-5-3.noarch.rpm
sudo rpm -Uvh http://download.elff.bravenet.com/5/i386/elff-release-5-3.noarch.rpm
sudo yum makecache
sudo yum install gcc curl-devel libxslt-devel expat-devel sqlite-devel readline-devel libtermcap-devel libxml2-devel
sudo yum install bison autoconf asciidoc xmlto --enablerepo=rpmforge

# make the source dir if its not there:
SRC_DIR=/usr/local/src
BIN_DIR=/usr/local/bin
sudo mkdir -p $SRC_DIR
sudo chown -R $USER:users $SRC_DIR
sudo chmod -R g+w $SRC_DIR


cd $SRC_DIR
# fetch and install git
wget http://kernel.org/pub/software/scm/git/git-1.6.4.tar.gz
tar -xzf git-1.6.4.tar.gz
cd git-1.6.4
make && make install

git checkout -b 1.6.4 v1.6.4
git checkout -b 1.6.4-doc-fixed

# remove the ctrl-G characters on line 435
sed 's/[[:cntrl:]]//g' Documentation/git-filter-branch.xml

sudo make prefix=/usr/local install all man
which git

# make ruby
cd $SRC_DIR
git clone git://github.com/rubyspec/matzruby.git matzruby-git
cd matzruby-git/
git co -b 1_8_6_383 v1_8_6_383
autoconf && ./configure --prefix=/usr/local
make clean && make
sudo make install
which ruby
ruby -v

# rubygems
cd $SRC_DIR
wget http://rubyforge.org/frs/download.php/60718/rubygems-1.3.5.tgz
tar -xzf rubygems-1.3.5.tgz
cd rubygems-1.3.5
sudo ruby setup.rb
gem env

# add github and opscode as sources for gems
sudo gem sources -a http://gems.github.com
sudo gem source -a http://gems.opscode.com/


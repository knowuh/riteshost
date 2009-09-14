#!/usr/bin/env bash
BASE_DIR=~/rites_host
cd $BASE_DIR
source $BASE_DIR/mysql.sh
source $BASE_DIR/ruby.sh
source $BASE_DIR/apache.sh
source $BASE_DIR/rails.sh
source $BASE_DIR/jruby.sh

#########################################################
# install required c++ library (needed for passenger)
#########################################################
sudo yum install -y gcc-c++ 

#########################################################
# configure web-root directory
#########################################################
WEB_ROOT=/web
RITES_ROOT=$WEB_ROOT/rites
GIT_SOURCE=git://github.com/stepheneb/rigse.git
sudo mkdir -p $RITES_ROOT
sudo chown -R $USER:users $RITES_ROOT

#########################################################
# install rails and passenger gems
#########################################################
sudo gem install rails mysql passenger 

#########################################################
# run passenger setup
#########################################################
cd
sudo -E passenger-install-apache2-module -a

#########################################################
# pull some version from github 
# (later we will just cap deploy xxxx where xxx is here)
#########################################################
cd $RITES_ROOT
rm -rf git clone $GIT_SOURCE $RITES_ROOT/current
git clone $GIT_SOURCE $RITES_ROOT/current
cd $RITES_ROOT/current
git co origin/staging

#########################################################
# configure web-server
#########################################################
# Please edit your Apache configuration file, and add these lines:
# 
#    LoadModule passenger_module /usr/local/lib/ruby/gems/1.8/gems/passenger-2.2.5/ext/apache2/mod_passenger.so
#    PassengerRoot /usr/local/lib/ruby/gems/1.8/gems/passenger-2.2.5
#    PassengerRuby /usr/local/bin/ruby

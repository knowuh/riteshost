#!/usr/bin/env bash
BASE_DIR=~/rites_host
cd $BASE_DIR
source $BASE_DIR/mysql.sh
source $BASE_DIR/ruby.sh
source $BASE_DIR/apache.sh
source $BASE_DIR/rails.sh


# we probably need to pass some arguments here:
sudo gem install rails mysql passenger 

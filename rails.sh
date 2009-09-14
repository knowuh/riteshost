#!/usr/bin/env bash
BASE_DIR=~/rites_host
cd $BASE_DIR
source $BASE_DIR/setpaths.sh

sudo gem install --no-ri --no-rdoc rails mysql mongrel capistrano capistrano-ext chriseppstein-compass has_many_polymorphs haml passenger

# probably other gems would be good too
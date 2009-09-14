#!/usr/bin/env bash
BASE_DIR=~/rites_host
cd $BASE_DIR
source $BASE_DIR/setpaths.sh
source $BASE_DIR/base.sh

# install apache and friends
sudo yum install -y httpd httpd-devel mod_ssl 

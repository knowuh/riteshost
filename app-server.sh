#!/bin/env bash
cd ~
sudo setenforce 0
# mysql clents must be installed, with headers and libs:
sudo yum install mysql mysql-dev

# install apache and friends
sudo yum install httpd httpd-devel mod_ssl mod_passenger rubygem-passenger


# we probably need to pass some arguments here:
sudo gem install mysql rake passenger 

# sudo gem install rails
# other gems should go here.
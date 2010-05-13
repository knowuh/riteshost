#!/usr/bin/env bash
BASE_DIR=~/rites_host
cd $BASE_DIR

if [ -e $BASE_DIR/database_properties.sh ]; then
  echo "using db properties found in $BASE_DIR/database_properties.sh"
  echo "delete this file ($BASE_DIR/database_properties.sh ) to reset"
  source $BASE_DIR/database_properties.sh
else
  echo -n "Please enter the db USERNAME for ccportal db (eg: portal_admin): "
  read PORTAL_USER
  echo -n "Please enter the db password for ccportal db (eg: s33kr3t): "
  read PORTAL_PASS
  echo -n "Please enter the db USERNAME for rails db (eg: rails): "
  read RAILS_USER
  echo -n "Please enter the db PASSWORD for rails db (eg: s33kr3t): "
  read RAILS_PASS
  echo "PORTAL_USER=$PORTAL_USER" >> $BASE_DIR/database_properties.sh 
  echo "PORTAL_PASS=$PORTAL_PASS" >> $BASE_DIR/database_properties.sh 
  echo "RAILS_USER=$RAILS_USER" >> $BASE_DIR/database_properties.sh 
  echo "RAILS_PASS=$RAILS_PASS" >> $BASE_DIR/database_properties.sh 
fi

###################################################
# CREATE TABLES:
###################################################
mysqladmin -f -u root drop mystery4
mysqladmin -f -u root drop ccportal
mysqladmin -f -u root drop sunflower
mysqladmin -f -u root drop rails

mysqladmin -f -u root create mystery4
mysqladmin -f -u root create ccportal
mysqladmin -f -u root create sunflower
mysqladmin -f -u root create rails

$BASE_DIR/db-user.rb $PORTAL_USER $PORTAL_PASS mystery4 ccportal sunflower
$BASE_DIR/db-user.rb $RAILS_USER $RAILS_PASS rails

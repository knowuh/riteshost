#!/usr/bin/env bash
BASE_DIR=~/rites_host
cd $BASE_DIR
source $BASE_DIR/setpaths.sh
source $BASE_DIR/base.sh
source $BASE_DIR/mysql.sh

###################################################
# INSTALL MYSQL SERVER FROM RPMS:
###################################################
sudo /etc/init.d/mysqld stop
sudo yum remove -y mysql-server
sudo yum install -y mysql-server

###################################################
# start the MYSQL SERVER
###################################################
sudo /etc/init.d/mysqld start

if [ -e $BASE_DIR/database_properties.sh ]; then
  echo "using db properties found in $BASE_DIR/database_properties.sh"
  echo "delete this file ($BASE_DIR/database_properties.sh ) to reset"
  source $BASE_DIR/database_properties.sh
else
  echo -n "Please enter the db USERNAME for SAKAI db (eg: sakai): "
  read SAKAI_USER
  echo -n "Please enter the db password for sakai db (eg: s33kr3t): "
  read SAKAI_PASS
  echo -n "Please enter the db USERNAME for RITES db (eg: rites): "
  read RITES_USER
  echo -n "Please enter the db PASSWORD for RITES db (eg: s33kr3t): "
  read RITES_PASS
  echo "SAKAI_USER=$SAKAI_USER" >> $BASE_DIR/database_properties.sh 
  echo "SAKAI_PASS=$SAKAI_PASS" >> $BASE_DIR/database_properties.sh 
  echo "RITES_USER=$RITES_USER" >> $BASE_DIR/database_properties.sh 
  echo "RITES_PASS=$RITES_PASS" >> $BASE_DIR/database_properties.sh 
fi

###################################################
# CREATE TABLES:
###################################################
mysqladmin -f -u root drop sakai_test
mysqladmin -f -u root drop sakai_dev
mysqladmin -f -u root drop sakai_pro

mysqladmin -f -u root drop rites_test
mysqladmin -f -u root drop rites_dev
mysqladmin -f -u root drop rites_pro


mysqladmin -f -u root create sakai_test
mysqladmin -f -u root create sakai_dev
mysqladmin -f -u root create sakai_pro

mysqladmin -f -u root create rites_test
mysqladmin -f -u root create rites_dev
mysqladmin -f -u root create rites_pro


source $BASE_DIR/db-user.sh sakai $SAKAI_USER $SAKAI_PASS
source $BASE_DIR/db-user.sh rites $RITES_USER $RITES_PASS

# mysqladmin -f -u root drop sds_test
# mysqladmin -f -u root drop sds_dev
# mysqladmin -f -u root drop sds_pro
# 
# mysqladmin -f -u root drop portal_test
# mysqladmin -f -u root drop portal_dev
# mysqladmin -f -u root drop portal_pro

# mysqladmin -f -u root create sds_test
# mysqladmin -f -u root create sds_dev
# mysqladmin -f -u root create sds_pro
# 
# mysqladmin -f -u root create portal_test
# mysqladmin -f -u root create portal_dev
# mysqladmin -f -u root create portal_pro

# source $BASE_DIR/db-user.sh sds sSdDsS sds
# source $BASE_DIR/db-user.sh portal p0rt0l portal







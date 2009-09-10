#!/usr/bin/env bash
BASE_DIR=~/rites_host
cd $BASE_DIR
source $BASE_DIR/setpaths.sh
source $BASE_DIR/base.sh
source $BASE_DIR/mysql.sh

###################################################
# INSTALL MYSQL SERVER FROM RPMS:
###################################################
sudo yum install mysql-server

###################################################
# CREATE TABLES:
###################################################
mysqladmin -u root create sakai-test
mysqladmin -u root create sakai-dev
mysqladmin -u root create sakai-pro

mysqladmin -u root create rites-test
mysqladmin -u root create rites-dev
mysqladmin -u root create rites-pro

mysqladmin -u root create sds-test
mysqladmin -u root create sds-dev
mysqladmin -u root create sds-pro

mysqladmin -u root create portal-test
mysqladmin -u root create portal-dev
mysqladmin -u root create poeral-pro
 
# create user 'USER'@'%.concord.org' identified by 'PASSWORD';
# create user 'USER'@'localhost' identified by 'PASSWORD';
# grant all privileges on DB_NAME.* to 'USER'@'%.concord.org' with grant option;
# grant all privileges on DB_NAME.* to 'USER'@'localhost' with grant option;
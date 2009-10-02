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


DATESTR=`/bin/date +"%F_%H_%M"`

###################################################
# Patch my.cnf with patch-file
###################################################
mkdir -p $HOME/backups
cp /etc/my.cnf $HOME/backups/my.cnf_${DATESTR}
sudo patch ${BASE_DIR}/etc/my.cnf ${BASE_DIR}/etc/my.cnf.patch -o /etc/my.cnf

###################################################
# use the /data direcotry  (warning: destructive!!)
# only has to be done once really...
# http://www.halfzerocan.com/howto-move-your-mysql-database-directory-to-a-second-hard-drive/|
###################################################
DST_DIR=/data/
DST_MYSQL_DATA_DIR=/${DST_DIR}/mysqldata

if [ -e $DST_MYSQL_DATA_DIR]; then
  echo "mysql data directory $DST_MYSQL_DATA_DIR exists: "
  echo "skipping this step.  Move $DST_MYSQL_DATA_DIR to force change"
  echo "creating backup file ${DST_DIR}/db_backup_${DATESTR}.tar.gz incase you want to delete it"
  tar -cvzf ${DST_DIR}/db_backup_${DATESTR}.tar.gz $DST_MYSQL_DATA_DIR
else
  SRC_MYSQL_DATA_DIR=/var/lib/mysql
  sudo mkdir -p $MYSQL_DATA_DIR
  cd $DATA_DIR
  sudo cp -R ${SRC_MYSQL_DATA_DIR}/* $DST_MYSQL_DATA_DIR
  sudo chown -R mysql.mysql $DST_MYSQL_DATA_DIR
  sudo mv $SRC_MYSQL_DATA_DIR ${SRC_MYSQL_DATA_DIR}_backup_${DATESTR}
  sudo ln -s ${DST_MYSQL_DATA_DIR}/ $SRC_MYSQL_DATA_DIR
  sudo chown mysql.mysql $SRC_MYSQL_DATA_DIR
fi

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


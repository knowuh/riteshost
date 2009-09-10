#!/usr/bin/env bash
SRC_DIR=~/src
mkdir -p $SRC_DIR
cd $SRC_DIR

MYSQL_VERSION=5.1.38
MYSQL_TAR_FILE_NAME=mysql-$MYSQL_VERSION.tar.gz
MYSQL_BUILD_DIR=mysql-$MYSQL_VERSION

if [ -e $MYSQL_TAR_FILE_NAME ]; then
  echo "$MYSQL_TAR_FILE_NAME exists, not downloading"
else
  wget http://dev.mysql.com/get/Downloads/MySQL-5.1/mysql-5.1.38.tar.gz/from/ftp://mirror.anl.gov/pub/mysql/
fi

if [ -e $MYSQL_BUILD_DIR ]; then
  rm -rf $MYSQL_BUILD_DIR
fi

tar -zxf $MYSQL_TAR_FILE_NAME
cd $MYSQL_BUILD_DIR



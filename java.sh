#!/usr/bin/env bash
BASE_DIR=~/rites_host
cd $BASE_DIR
source $BASE_DIR/setpaths.sh
source $BASE_DIR/base.sh

###########################################
# install java from rpm:
###########################################
sudo setenforce 0
sudo yum install -y java-1.6.0-openjdk java-1.6.0-openjdk-devel


###########################################
# set JAVA_HOME and export
###########################################
JAVA_HOME=/usr/lib/jvm/jre/
export JAVA_HOME
if grep JAVA_HOME /etc/skel/.bash_profile ; then 
  sudo echo "JAVA_HOME already set in .bash_profile"
else
  sudo echo "JAVA_HOME=$JAVA_HOME" >> /etc/skel/.bash_profile;
  sudo echo "export JAVA_HOME" >> /etc/skel/.bash_profile;
fi

###########################################
# ant from binary distro:
###########################################
ANT_VERSION=1.7.1
ANT_TARBALL=apache-ant-$ANT_VERSION-bin.tar.gz
ANT_DEST=$SRC_DIR/apache-ant-$ANT_VERSION
ANT_BIN=$BIN_DIR/ant
ANT_DOWNLOAD=http://apache.cyberuse.com/ant/binaries/$ANT_TARBALL
cd $SRC_DIR
if [ -e $SRC_DIR/$ANT_TARBALL ]; then
  echo "$ANT_TARBALL found"
else
  wget $ANT_DOWNLOAD
fi

if [ -e $ANT_DEST ]; then
  rm -rf $ANT_DEST
fi
tar -zxf $ANT_TARBALL
cd $ANT_DEST

if [ -e $ANT_BIN ]; then
 sudo rm $ANT_BIN
fi
sudo ln -s $ANT_DEST/bin/ant $ANT_BIN


###########################################
# maven binary distro:
###########################################
# http://mirrors.kahuki.com/apache/maven/binaries/apache-maven-2.2.1-bin.tar.gz
MVN_VERSION=2.2.1
MVN_TARBALL=apache-maven-$MVN_VERSION-bin.tar.gz
MVN_DEST=$SRC_DIR/apache-maven-$MVN_VERSION
MVN_BIN=$BIN_DIR/mvn
MVN_DOWNLOAD=http://mirrors.kahuki.com/apache/maven/binaries/$MVN_TARBALL
cd $SRC_DIR
if [ -e $SRC_DIR/$MVN_TARBALL ]; then
  echo "$MVN_TARBALL found"
else
  wget $MVN_DOWNLOAD
fi

if [ -e $MVN_DEST ]; then
  rm -rf $MVN_DEST
fi
tar -zxf $MVN_TARBALL
cd $MVN_DEST

if [ -e $MVN_BIN ]; then
 sudo rm $MVN_BIN
fi
sudo ln -f -s $MVN_DEST/bin/mvn $MVN_BIN

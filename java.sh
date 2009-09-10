#!/bin/env bash
SRC_DIR=/usr/local/src
BIN_DIR=/usr/local/bin
sudo mkdir -p $SRC_DIR
sudo chown -R $USER:users $SRC_DIR
sudo chmod -R g+w $SRC_DIR

# install java from rpm:
sudo setenforce 0
sudo yum install java-1.6.0-openjdk java-1.6.0-openjdk-devel

# install ant
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


# install jruby from github sources
JRUBY_HOME=$SRC_DIR/jruby

# jruby source
if [ -e $JRUBY_HOME ]; then
  echo "found $JRUBY_HOME, checkign for git updates"
  cd $JRUBY_HOME
  git pull
else
  cd $SRC_DIR
  git clone git://github.com/jruby/jruby.git $JRUBY_HOME
fi

# build
cd $JRUBY_HOME
ant

# smylink binaries



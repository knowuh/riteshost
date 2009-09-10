#!/usr/bin/env bash
BASE_DIR=~/rites_host
cd $BASE_DIR
source $BASE_DIR/setpaths.sh
source $BASE_DIR/base.sh
VERSION=1.6.4
PREFIX=/usr/local
GIT_DEST=$PREFIX/bin/git


#######################################
# build git
#######################################
cd $SRC_DIR
if [ -e $SRC_DIR/git-$VERSION.tar.gz ]; then
  echo "we already have $SRC_DIR/git-$VERSION.tar.gz skipping download"
else
  wget http://kernel.org/pub/software/scm/git/git-$VERSION.tar.gz
fi

if [ -e $GIT_DEST ]; then
  echo "we already have a git at, $GIT_DEST remove it to force rebuild"
else  
  tar -xzf git-$VERSION.tar.gz
  cd git-$VERSION
  make && make install
  git checkout -b $VERSION v1.6.4
  git checkout -b $VERSION-doc-fixed
  # remove the ctrl-G characters on line 435
  sed -i -e 's/[[:cntrl:]]//g' Documentation/git-filter-branch.xml
  sudo make prefix=$PREFIX install all man
fi

which git


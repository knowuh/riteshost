#!/usr/bin/env bash
BASE_DIR=~/rites_host
cd $BASE_DIR
source $BASE_DIR/git.sh
PREFIX_DIR=/usr/local
RUBY_DEST=$PREFIX_DIR/bin/ruby

if [ -e $RUBY_DEST ]; then
  echo "we already have $RUBY_DEST, delete it to force a build"
else
  #######################################
  # build ruby
  #######################################
  cd $SRC_DIR
  if [ -e $SRC_DIR/matzruby.git ]; then
    echo "we already have $SRC_DIR/matzruby.git skipping clone step, delete it to force download"
  else
    git clone git://github.com/stepheneb/matzruby.git matzruby-git
  fi
  cd matzruby-git/
  git co -b 1_8_6_383_fix_logger
  autoconf && ./configure --prefix=$PREFIX_DIR
  make clean && make
  sudo make install
fi

ruby -v

#######################################
# build ruby-gems
#######################################
VERSION=1.3.5
if [ -e $SRC_DIR/rubygems-$VERSION.tgz ]; then
  echo "ruby gems appears to have been installed, remove $SRC_DIR/rubygems-$VERSION.tgz to force"
else
  cd $SRC_DIR
  wget http://rubyforge.org/frs/download.php/60718/rubygems-$VERSION.tgz
  tar -xzf rubygems-$VERSION.tgz
  cd rubygems-$VERSION
  sudo ruby setup.rb
  gem env
  
  #######################################
  # add some gem source locations
  #######################################
  sudo gem sources -a http://gems.rubyforge.org
  sudo gem sources -a http://gems.github.com
  sudo gem sources -a http://gems.opscode.com
fi


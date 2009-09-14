#!/usr/bin/env bash
BASE_DIR=~/rites_host
cd $BASE_DIR
source $BASE_DIR/git.sh
source $BASE_DIR/java.sh
PREFIX_DIR=/usr/local
RUBY_DEST=$PREFIX_DIR/bin/ruby

#######################################
# build jruby from git sources
#######################################
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

JRUBY=$JRUBY_HOME/bin/jruby


#######################################
# setup gems for jruby
#######################################
# sources:
$JRUBY -S gem sources -a http://gems.rubyforge.org
$JRUBY -S gem sources -a http://gems.github.com
$JRUBY -S gem sources -a http://gems.opscode.com
$JRUBY -S gem sources -a http://gems.datamapper.org
# gems:
$JRUBY -S gem install --no-ri --no-rdoc rake jdbc-mysql jdbc-sqlite3 rails activerecord-jdbc-adapter activerecord-jdbcmysql-adapter
$JRUBY -S gem install --no-ri --no-rdoc mongrel capistrano capistrano-ext chriseppstein-compass has_many_polymorphs haml hpricot
# remove DOS bat files
sudo rm -rf $JRUBY_HOME/bin/*.bat

# smylink binaries to $BIN_DIR
for FILE in $(find $JRUBY_HOME/bin); do
  sudo ln -s -F $FILE $BIN_DIR
done



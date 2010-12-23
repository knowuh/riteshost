#!/usr/bin/env bash
source git.sh
RUBY_DEST=$PREFIX_DIR/bin/ruby
SRC_DIR=$BASE_DIR/src
RUBY_VERSION=ruby-1.9.2-p0
mkdir -p $SRC_DIR
cd $BASE_DIR

#######################################
# remove ruby yum packge if it is installed
#######################################
#######################################
# build ruby
#######################################
if [ -e $RUBY_DEST ]; then
  echo "we already have $RUBY_DEST, delete it to force a build"
else
  # must have base ruby
  sudo yum -y install ruby
  sudo yum -y install ruby-libs.i386 
  # to build ruby. (seriously)
  cd $SRC_DIR
  # if we want 1.8.7
  # wget ftp://ftp.ruby-lang.org//pub/ruby/1.8/ruby-1.8.7-p302.tar.gz
  wget ftp://ftp.ruby-lang.org//pub/ruby/1.9/$RUBY_VERSION.tar.gz
  tar -zxvf $RUBY_VERSION.tar.gz
  cd $RUBY_VERSION
  ./configure --prefix=$PREFIX_DIR
  make clean && make
  sudo make install
  sudo yum -y remove ruby
  sudo yum -y remove ruby-libs.i386 
fi

ruby -v

#######################################
# build ruby-gems
#######################################
GEM_VERSION=1.3.7
GEM_RFPID=70696
if [ -e $SRC_DIR/rubygems-$GEM_VERSION.tgz ]; then
  echo "ruby gems appears to have been installed, remove $SRC_DIR/rubygems-$GEM_VERSION.tgz to force"
else
  cd $SRC_DIR
  wget http://rubyforge.org/frs/download.php/$GEM_RFPID/rubygems-$GEM_VERSION.tgz
  tar -xzf rubygems-$GEM_VERSION.tgz
  cd rubygems-$GEM_VERSION
  sudo ruby setup.rb
  gem env
  
  #######################################
  # add some gem source locations
  #######################################
  sudo gem sources -a http://gems.rubyforge.org
  sudo gem sources -a http://gems.github.com
  sudo gem sources -a http://gems.opscode.com
fi

#######################################
# install some default gems
#######################################

sudo gem install rake
sudo gem install highline
sudo gem install bundler
sudo gem install passenger

#TADA!


#!/usr/bin/env bash
source git.sh
RUBY_DEST=$PREFIX_DIR/bin/ruby
SRC_DIR=$BASE_DIR/src
RUBY_VERSION=v1_8_7_302
mkdir -p $SRC_DIR
cd $BASE_DIR

#######################################
# remove ruby yum packge if it is installed
#######################################
sudo yum -y remove ruby
sudo yum -y remove ruby-libs.i386 
#######################################
# build ruby
#######################################
if [ -e $RUBY_DEST ]; then
  echo "we already have $RUBY_DEST, delete it to force a build"
else
  cd $SRC_DIR
  if [ -e $SRC_DIR/matzruby.git ]; then
    echo "we already have $SRC_DIR/matzruby.git skipping clone step, delete it to force download"
  else
    git clone https://github.com/rubyspec/matzruby.git $SRC_DIR/matzruby-git
  fi
  cd $SRC_DIR/matzruby-git
  git co $RUBY_VERSION
  autoconf && ./configure --prefix=$PREFIX_DIR
  make clean && make
  sudo make install
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

sudo gem install --no-ri --no-rdoc  rake
sudo gem install --no-ri --no-rdoc  highline
# TODO: Might be really useful to install RVM sometime....



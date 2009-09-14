#!/usr/bin/env bash

#######################################
# make the shared source tree if needed
#######################################
PREFIX_DIR=/usr/local
SRC_DIR=$PREFIX_DIR/src
BIN_DIR=$PREFIX_DIR/bin

sudo mkdir -p $SRC_DIR
sudo chown -R ${USER}:users $SRC_DIR
sudo chmod -R g+w $SRC_DIR

# crazy, but make sure that the user can write to files in their home directoy
# because some of the previous runs might have messed up .gemrc &etc.
cd ~
sudo chown -R $USER $HOME
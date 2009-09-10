#!/usr/bin/env bash

#######################################
# make the shared source tree if needed
#######################################
SRC_DIR=/usr/local/src
BIN_DIR=/usr/local/bin
sudo mkdir -p $SRC_DIR
sudo chown -R $USER:users $SRC_DIR
sudo chmod -R g+w $SRC_DIR
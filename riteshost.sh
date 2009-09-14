#!/usr/bin/env bash
ssh $* mkdir -p ./rites_host
scp -r $HOME/rites_host/* $*:rites_host
ssh $* ls -lah

#!/usr/bin/env bash
#ssh $* mkdir -p ./rites_host
#scp -r $HOME/rites_host/* $*:rites_host
HOST=$*
EXCLUDE_FROM="excludes"
rsync -rtzPue ssh --exclude-from=$EXCLUDE_FROM $HOME/rites_host/ ${HOST}:rites_host/

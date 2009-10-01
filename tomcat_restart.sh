#!/usr/bin/env bash

JAVA_HOME=/usr/lib/jvm/jre/
TOMCAT_DEST=/web/tomcat
TOMCAT_SYMLINK=$TOMCAT_DEST/tomcat
export JAVA_HOME
$TOMCAT_SYMLINK/bin/shutdown.sh
sleep 5
export JAVA_OPTS="-server -Xms768m -Xmx768m -XX:PermSize=128m -XX:MaxPermSize=256m -XX:NewSize=192m -XX:MaxNewSize=384m"
$TOMCAT_SYMLINK/bin/startup.sh

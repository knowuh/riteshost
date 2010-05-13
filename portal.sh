#!/usr/bin/env bash
BASE_DIR=~/rites_host
cd $BASE_DIR
PORTAL_WEB_ROOT=/web/portal

# source ${BASE_DIR}/ruby.sh
# source ${BASE_DIR}/git.sh
# source ${BASE_DIR}/mysql.sh
# source ${BASE_DIR}/mysql-server.sh
# source ${BASE_DIR}/portal_db.sh
# source ${BASE_DIR}/apache.sh
# sudo yum install -y php php-gd php-mysql
sudo mkdir -p /etc/httpd/conf.d/vhosts
sudo cp -r ${BASE_DIR}/etc/httpd/conf.d/vhosts/* /etc/httpd/conf.d/vhosts
echo "Be sure to add 'Include /etc/httpd/conf.d/vhosts/*' to the end of /etc/httpd/conf/httpd.conf"

sudo mkdir -p ${PORTAL_WEB_ROOT}
sudo chgrp -R users ${PORTAL_WEB_ROOT}
sudo chmod -R g+w ${PORTAL_WEB_ROOT} 
cd ${PORTAL_WEB_ROOT}
svn co https://svn.concord.org/svn/ccportal/trunk .
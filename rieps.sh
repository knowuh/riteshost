#!/usr/bin/env bash
BASE_DIR=~/rites_host
cd $BASE_DIR
source $BASE_DIR/mysql.sh
source $BASE_DIR/apache.sh
source $BASE_DIR/java.sh

# where tomcat will go
TOMCAT_DEST=/web/tomcat
sudo mkdir -p $TOMCAT_DEST
sudo chown -R $USER:users $TOMCAT_DEST

# where sakai source will go
SAKAI_WORKING_DIR=/web/src/sakai
sudo mkdir -p $SAKAI_WORKING_DIR
sudo chown -R $USER:users $SAKAI_WORKING_DIR

TOMCAT_SYMLINK=$TOMCAT_DEST/tomcat
TC_5_5_27=apache-tomcat-5.5.27
TC_5_5_25=apache-tomcat-5.5.25
TC_SAKAI_VERSION=$TC_5_5_25

SAKAI_TOMCAT_ARCHIVE=$TC_SAKAI_VERSION.tar.gz
SAKAI_TOMCAT=$TOMCAT_DEST/$TC_SAKAI_VERSION

# and probably dont want to change these...
cd $SAKAI_WORKING_DIR

RSMART_SAKAI_SRC=$SAKAI_WORKING_DIR/rinet25
SAKAI_DIR=$TOMCAT_SYMLINK/sakai
SAKAI_FILES=$TOMCAT_DEST/sakai-files

TOMCAT_ARCHIVE=$SAKAI_WORKING_DIR/apache-tomcat-5.5.27.zip
RSMART_SAKAI_ARCHIVE=$SAKAI_WORKING_DIR/rinet25.tar.gz 
MYSQL_ADAPTOR_ARCHIVE=$SAKAI_WORKING_DIR/mysql-connector-java-5.1.8.tar.gz
DATA_BASE_ARCHIVE=$SAKAI_WORKING_DIR/rinet25_nightly.sql.gz

SCP_SRC=terra.concord.org:/export/shared/Projects/RITES/src_archives/*.gz 


# copy all the archives from terra if the RSMART_SAKAI_ARCHIVE is missing
if [ -e $RSMART_SAKAI_ARCHIVE ]; then
  echo "$RSMART_SAKAI_ARCHIVE exists, not downloading anything from TERA"
else
  scp $SCP_SRC .
  # unzip the RSMART_SAKAI_ARCHIVE
  tar -zxf $RSMART_SAKAI_ARCHIVE
fi

# http://mysql.mirrors.pair.com/Downloads/Connector-J/mysql-connector-java-5.1.8.tar.gz
# copy all the required jdbc drivers
if [ -e $MYSQL_ADAPTOR_ARCHIVE ]; then
  echo "$MYSQL_ADAPTOR_ARCHIVE exists, not downloading jdbc drivers"
else
  wget http://mysql.mirrors.pair.com/Downloads/Connector-J/mysql-connector-java-5.1.8.tar.gz
  tar -zxf $MYSQL_ADAPTOR_ARCHIVE
fi

# http://archive.apache.org/dist/tomcat/tomcat-5/v5.5.25/bin/apache-tomcat-[VERSION].tar.gz
# copy binary distro of apache version we want.
if [ -e $SAKAI_TOMCAT_ARCHIVE ]; then
  echo "tomcat archive $SAKAI_TOMCAT_ARCHIVE exists, not downloading tomcat"
else
  wget http://archive.apache.org/dist/tomcat/tomcat-5/v5.5.25/bin/$SAKAI_TOMCAT_ARCHIVE
fi

# stop the running tomcat if its there...
$TOMCAT_SYMLINK/bin/shutdown.sh

# relink TOMCAT_SYMLINK to 5.5.27
rm -rf $SAKAI_TOMCAT
rm -rf $TOMCAT_SYMLINK
cp $SAKAI_TOMCAT_ARCHIVE $TOMCAT_DEST
cd $TOMCAT_DEST
tar -zxf $SAKAI_TOMCAT_ARCHIVE
ln -s $SAKAI_TOMCAT $TOMCAT_SYMLINK


# copy the database driver
cp $SAKAI_WORKING_DIR/mysql-connector-java-5.1.8/mysql-connector-java-5.1.8-bin.jar $TOMCAT_SYMLINK/common/lib/

# make saki directories in tomcat-land
mkdir -p $SAKAI_DIR
mkdir -p $SAKAI_FILES

# put in the demo config files in the sakai dir
# Note we could (?should) use the 'production' files
cp $RSMART_SAKAI_SRC/reference/demo/*.properties $SAKAI_DIR
cp $SAKAI_DIR/prod.local.properties $SAKAI_DIR/local.properties
cp $SAKAI_DIR/prod.sakai.properties $SAKAI_DIR/sakai.properties
cp $RSMART_SAKAI_SRC/reference/demo/tomcat/bin/setenv.sh $TOMCAT_SYMLINK/bin/
cp $RSMART_SAKAI_SRC/reference/demo/index.html $TOMCAT_SYMLINK/webapps/ROOT/
cp $RSMART_SAKAI_SRC/reference/library/src/webapp/icon/favicon.ico  $TOMCAT_SYMLINK/webapps/ROOT/
cp $RSMART_SAKAI_SRC/reference/demo/tomcat/conf/server.xml $TOMCAT_SYMLINK/conf/server.xml

# remove this source file, as per http://jira.sakaiproject.org/browse/SAK-13126
find $RSMART_SAKAI_SRC -name DataSourceWrapperAutoCommit.java | xargs rm

# make sure executibles are
chmod 755 $TOMCAT_SYMLINK/bin/*.sh

mkdir -p $SAKAI_FILES/sam/uploads
mkdir -p $SAKAI_FILES/melete/packagefiles

mkdir -p $SAKAI_FILES/melete/uploads
mkdir -p $SAKAI_FILES/jforum/images/avatar
mkdir -p $SAKAI_FILES/jforum/uploads
mkdir -p $SAKAI_FILES/jforum/packagefiles

cp -r $RSMART_SAKAI_SRC/melete/var/melete/packagefiles/* $SAKAI_FILES/melete/packagefiles/
cp -r $RSMART_SAKAI_SRC/jforum/var/jforum/packagefiles/* $SAKAI_FILES/jforum/packagefiles/

SED_SCRIPT="s:docBase=\(.*\):docBase=\"$SAKAI_FILES/jforum/images\">:"
sed $SED_SCRIPT $RSMART_SAKAI_SRC/jforum/jforum-images/jforum-images.xml > $TOMCAT_SYMLINK/conf/Catalina/localhost/jforum-images.xml

SED_SCRIPT1="s:jforum.files.basedir=\(.*\):jforum.files.basedir=$SAKAI_FILES/jforum:g" 
SED_SCRIPT2="s:installation.config=\(.*\):installation.config=$TOMCAT_SYMLINK/sakai/jforum-custom.conf:g" 
sed -e $SED_SCRIPT1 -e $SED_SCRIPT2 $RSMART_SAKAI_SRC/jforum/WEB-INF/config/SystemGlobals.properties > $SAKAI_DIR/SystemGlobals.properties

cp $RSMART_SAKAI_SRC/jforum/WEB-INF/config/jforum-custom.conf  $SAKAI_DIR/jforum-custom.conf

cd $RSMART_SAKAI_SRC
export MAVEN_OPTS="-Xmx384m -XX:PermSize=48m"
mvn -Dmaven.test.skip=true -Dmaven.tomcat.home=$TOMCAT_SYMLINK clean install sakai:deploy

# copy the users file over
cp $BASE_DIR/tomcat-users.xml $TOMCAT_SYMLINK/conf/tomcat-users.xml 

# run the server,
export JAVA_OPTS="-server -Xms768m -Xmx768m -XX:PermSize=128m -XX:MaxPermSize=256m -XX:NewSize=192m -XX:MaxNewSize=384m"
$TOMCAT_SYMLINK/bin/startup.sh
# growlnotify -n "DONE" -m "reips build is complete. Hopefully it worked."
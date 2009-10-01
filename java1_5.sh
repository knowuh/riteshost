#!/usr/bin/env bash
BASE_DIR=~/rites_host
cd $BASE_DIR
source $BASE_DIR/setpaths.sh
source $BASE_DIR/base.sh
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!! This task is not completely tested, please fix      !!!"
echo "!!!! see documentation on how to install java 1.5        !!!"
echo "!!!! http://wiki.centos.org/HowTos/JavaOnCentOS          !!!"
echo "!!!! local files on                                      !!!"
echo "!!!! terra:/export/shared/Projects/RITES/src_archives/   !!!"  
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

echo "setting up rpmtools: http://wiki.centos.org/HowTos/SetupRpmBuildEnvironment"
sudo yum install rpm-build
sudo yum install redhat-rpm-config
mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros

echo "copying java files from sun and src rpm descriptions from terra"
scp terra.concord.org:/export/shared/Projects/RITES/src_archives/jdk-1_5_0_15-linux-i586.bin ~/rpmbuild/SOURCES
scp terra.concord.org:/export/shared/Projects/RITES/src_archives/java-1.5.0-sun-1.5.0.15-1jpp.nosrc.rpm .
rpmbuild --rebuild java-1.5.0-sun-1.5.0.15-1jpp.nosrc.rpm

echo "installing sun java dependencies"
sudo yum install libX11-devel
sudo yum install libX11
sudo yum install libXp-devel

echo "installing built rpms"
sudo rpm -Uvh ~/rpmbuild/RPMS/java-1.5.0-sun-fonts-1.5.0.15-1jpp.i586.rpm
sudo rpm -Uvh ~/rpmbuild/RPMS/java-1.5.0-sun-alsa-1.5.0.15-1jpp.i586.rpm
sudo rpm -Uvh ~/rpmbuild/RPMS/java-1.5.0-sun-devel-1.5.0.15-1jpp.i586.rpm

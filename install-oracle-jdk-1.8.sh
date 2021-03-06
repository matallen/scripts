#!/bin/sh

mkdir -p /opt/rh
cd /opt/rh

wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u11-b12/jdk-8u11-linux-x64.tar.gz
gunzip jdk-8u11-linux-x64.tar.gz
tar -xvf jdk-8u11-linux-x64.tar

JDKS=`find . -maxdepth 1 -name "jdk*" -type d`;
for folder in $JDKS
do
 ln -s $folder jdk_current
 ln -s `pwd`/jdk_current/bin/java /bin/java
 export JAVA_HOME=/opt/rh/jdk_current
done

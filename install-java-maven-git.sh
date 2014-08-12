ssh -t $1 -l root <<EOF

set -x

rm -rf /opt/rh
mkdir -p /opt/rh
cd /opt/rh

rm -rf /bin/java
rm -rf /bin/mvn


# install java 7
wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.tar.gz -O jdk-7u67-linux-x64.tar.gz
gunzip jdk-7u67-linux-x64.tar.gz
tar -xvf jdk-7u67-linux-x64.tar
ln -s /opt/rh/jdk1.7.0_67 /opt/rh/jdk1.8_latest

# install java 8
wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u11-b12/jdk-8u11-linux-x64.tar.gz -O jdk-8u11-linux-x64.tar.gz
gunzip jdk-8u11-linux-x64.tar.gz
tar -xvf jdk-8u11-linux-x64.tar
ln -s /opt/rh/jdk1.8.0_11 /opt/rh/jdk1.8_latest

# setup current java
ln -s /opt/rh/jdk1.8_latest /opt/rh/jdk_current
ln -s /opt/rh/jdk_current/bin/java /bin/java
export JAVA_HOME=/opt/rh/jdk_current


# install maven 3.2.1
wget ftp://mirror.reverse.net/pub/apache/maven/maven-3/3.2.1/binaries/apache-maven-3.2.1-bin.tar.gz
gunzip apache-maven-3.2.1-bin.tar.gz
tar -xvf apache-maven-3.2.1-bin.tar

# setup maven
ln -s /opt/rh/apache-maven-3.2.1 /opt/rh/maven_current
ln -s /opt/rh/maven_current/bin/mvn /bin/mvn
export M2_HOME=/opt/rh/maven_current

yum install -y git

set +x

EOF

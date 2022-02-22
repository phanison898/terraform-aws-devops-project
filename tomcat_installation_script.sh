#!/bin/bash

# change to admin access
sudo su -

# update yum packages
yum update -y

# install java
yum install java-1.8.0-openjdk-headless.x86_64 -y

# change directory to /opt
cd /opt

# download tomcat-8 tar file
wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.75/bin/apache-tomcat-8.5.75.tar.gz

# extract .tar file
tar -xvzf apache-tomcat-8.5.75.tar.gz

# delete .tar file
rm -rf apache-tomcat-8.5.75.tar.gz

# rename extracted folder to tomcat
mv apache-tomcat-8.5.75 tomcat

# create a link of startup.sh as tomcatup 
ln -s /opt/tomcat/bin/startup.sh /usr/local/bin/tomcatup

# create a link of shutdown.sh as tomcatdown
ln -s /opt/tomcat/bin/shutdown.sh /usr/local/bin/tomcatdown

# run the tomcat
tomcatup
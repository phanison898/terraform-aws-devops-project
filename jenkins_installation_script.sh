#!/bin/bash

# change to admin access
sudo su -

# update yum packages
yum update -y

# install java
yum install java-1.8.0-openjdk-headless.x86_64 -y

# install jenkins-docker-container
docker run --restart=always -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home/ --name=jenkins jenkins/jenkins:lts

# get jenkins secret key
jenkins_secret=docker exec $(docker ps -a -q) cat /var/jenkins_home/secrets/initialAdminPassword

echo $jenkins_secret > jenkins_secret.txt
# Terraform AWS DevOps Project

Performing DevOps continues integeration and continues deployment (CI/CD) by setting up Jenkins and Tomcat server on 2 different AWS-EC2 virtual Linux machines


#### How to launch jenkins
```
C:\Users\Your_user_name\path_to_pem_file> ssh -i <your_pem_file.pem> ec2-user@<jenkins_instance_ip_address>
```
```
ec2-user@xx.xx.xx.xx $ docker exec $(docker ps -a -q) cat /var/jenkins_home/secrets/initialAdminPassword
```
djhbhjkdskfksdghvsjdvgjsvfd

copy above secret text and paste in the jenkins application

# Terraform AWS DevOps Project

Performing DevOps continues integeration and continues deployment (CI/CD) by setting up Jenkins and Tomcat server on 2 different AWS-EC2 virtual Linux machines

#### 1. Clone the repo

```
git clone https://github.com/phanison898/terraform-aws-devops-project.git
```

#### 2. Create secrets.tfvars file

In the same directory, create new file as `secrets.tfvars` and add below lines to it

```
access_key    = <YOUR_AWS_ACCESS_KEY>
secret_key    = <YOUR_AWS_SECRETS>
region        = "us-east-1"
key_name      = <YOUR_AWS_PEM_KEY>
instance_type = "t2.micro"
ami           = "ami-0050e19f8a75d260f"

```

#### 3. Create EC2-Instances

Run below steps sequencially

```
1. terraform init
2. terraform validate
3. terraform plan -var-file="secrets.tfvars"
4. terraform apply -var-file="secrets.tfvars"
```

#### 4. Launch Tomcat EC2-Instance using SSH

- Connect to EC2-Instance

```
    ssh -i <path/to/key.pem> ec2-user@<aws_instance_public_ip>
```

- Edit tomcat-users.xml file by navigating to below directory

```
    sudo su -
    cd /
    vim opt/tomcat/conf/tomcat-users.xml
```

- Add below lines

```
     <role rolename="manager-gui"/>
     <role rolename="manager-script"/>
     <role rolename="manager-jmx"/>
     <role rolename="manager-status"/>
     <user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>
     <user username="deployer" password="deployer" roles="manager-script"/>
     <user username="tomcat" password="s3cret" roles="manager-gui"/>
```

- Search for below files

```
    cd opt/tomcat/conf/

    find / -name context.xml

    #you will see below files

    /opt/tomcat/webapps/host-manager/META-INF/context.xml
    /opt/tomcat/webapps/manager/META-INF/context.xml

    #Go into edit mode using vim and comment `Value className` tag

```

- Restart the Tomcat server

```
tomcatup
```

- Launch Tomcat server in browser using below url

```
    http://<instance_public_ip>:8080
```

#### 5. Launch Jenkins EC2-Instance using SSH

- Connect to Jenkins EC2-Instance

```
    ssh -i <path/to/key.pem> ec2-user@<aws_instance_public_ip>
```

- Run below command to get jenkins initial setup password

```
    sudo su -
    docker exec $(docker ps -a -q) cat /var/jenkins_home/secrets/initialAdminPassword

    # you will a key something like below
    hdjfhgyuigdcbjhbshjgvdfysvbgxc

    # use this key while setting up jenkins
```

- Launch Jenkins webapp using below url

```
    http://<instance_public_ip>:8080
```

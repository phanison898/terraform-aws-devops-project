# Terraform AWS DevOps Project

Performing DevOps continues integeration and continues deployment (CI/CD) by setting up Jenkins and Tomcat server on 2 different AWS-EC2 virtual Linux machines

#### 1. Clone the repo

```
https://github.com/phanison898/terraform-aws-devops-project.git
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

# resource "aws_instance" "jenkins_instance" {
#   ami             = var.ami
#   instance_type   = var.instance_type
#   key_name        = var.key_name
#   security_groups = [aws_security_group.jenkins_security_group.name]

#   user_data = file("jenkins_installation_script.sh")

#   tags = {
#     Name = "Jenkins"
#   }
# }

resource "aws_instance" "tomcat_instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.tomcat_security_group.name]
  count           = var.number_of_instances


  user_data = file("tomcat_installation_script.sh")

  tags = {
    Name = "Instance-${count.index + 1}"
  }
}


output "instance_public_ip" {
  description = "Get public ip's of available ec2-instances"
  value       = [aws_instance.tomcat_instance[*].public_ip]
  # value       = [aws_instance.jenkins_instance.public_ip, aws_instance.tomcat_instance.public_ip]
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.example.public_ip
}

output "route_table_name" {
  description = "The name of the route table"
  value       = aws_route_table.route_example.tags["Name"]
}

output "internet_gateway_name" {
  description = "The name of the Internet Gateway"
  value       = aws_internet_gateway.igw_example.tags["Name"]
}

output "ami_used" {
  description = "The AMI ID used for the EC2 instance"
  value       = var.ami_id
}

output "security_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.example_sg.name
}
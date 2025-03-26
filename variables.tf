variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "igw_name" {
  description = "Name of internet Gateway"
  type = string
}

variable "routetable_name"{
  description = "Name of the route table"
  type = string
}
variable "subnet_cidr_block" {
  description = "CIDR block for subnet"
  type = string
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "AZ for the Subnet"
  type = string
  default = "us-east-1a"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type = string
  default = "vpc-public-subnet"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC-2 instance type"
  type = string
  default = "t2.micro"
}
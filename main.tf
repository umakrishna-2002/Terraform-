resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}

resource "aws_internet_gateway" "igw_example"{
  vpc_id = aws_vpc.example.id
  tags ={
    Name = var.igw_name
  }
}

resource "aws_route_table" "route_example" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name = var.routetable_name
  }
}

resource "aws_route" "routing_example" {
  route_table_id = aws_route_table.route_example.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id =aws_internet_gateway.igw_example.id 
}

resource "aws_route_table_association" "subnet-to-rt"{
  subnet_id =aws_subnet.example_subnet.id
  route_table_id = aws_route_table.route_example.id 
}
resource "aws_subnet" "example_subnet" {
  vpc_id = aws_vpc.example.id
  cidr_block =var.subnet_cidr_block
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet_name
  }
}

resource "aws_security_group" "example_sg" {
  vpc_id = aws_vpc.example.id
  name   = "example-security-group"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-security-group"
  }
}

resource "aws_instance" "example"{
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.example_subnet.id
  security_groups = [aws_security_group.example_sg.id]
  tags = {
    Name="vpc-instance"
  }

}
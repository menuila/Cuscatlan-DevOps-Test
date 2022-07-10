# AWS
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-1"
}

# Keys
variable "DEVOPS_PRIVATE_KEY" {
  default = "DevOps-Key"
}
variable "DEVOPS_PUBLIC_KEY" {
  default = "DevOps-Key.pub"
}

# Images
variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0070c5311b7677678"
    us-east-2 = "ami-07f84a50d2dec2fa4"
    us-west-1 = "ami-040a251ee9d7d1a9b"
    us-west-2 = "ami-0aab355e1bfa1e72e"
  }
}

# Username
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
root@Terraform:~/Terraform/DevOps-2# cat vpc.tf
# Internet VPC for DevOps
resource "aws_vpc" "VPC-DevOps" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "VPC-DevOps"
  }
}

# Subnets for DevOps
resource "aws_subnet" "public-DevOps-1" {
  vpc_id                  = aws_vpc.VPC-DevOps.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "public-DevOps-1"
  }
}

resource "aws_subnet" "public-DevOps-2" {
  vpc_id                  = aws_vpc.VPC-DevOps.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "public-DevOps-2"
  }
}

resource "aws_subnet" "public-DevOps-3" {
  vpc_id                  = aws_vpc.VPC-DevOps.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "public-DevOps-3"
  }
}

resource "aws_subnet" "public-DevOps-4" {
  vpc_id                  = aws_vpc.VPC-DevOps.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1d"

  tags = {
    Name = "public-DevOps-4"
  }
}

resource "aws_subnet" "public-DevOps-5" {
  vpc_id                  = aws_vpc.VPC-DevOps.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1f"

  tags = {
    Name = "public-DevOps-5"
  }
}

resource "aws_subnet" "private-DevOps-1" {
  vpc_id                  = aws_vpc.VPC-DevOps.id
  cidr_block              = "10.0.11.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "private-DevOps-1"
  }
}

resource "aws_subnet" "private-DevOps-2" {
  vpc_id                  = aws_vpc.VPC-DevOps.id
  cidr_block              = "10.0.12.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "private-DevOps-2"
  }
}

resource "aws_subnet" "private-DevOps-3" {
  vpc_id                  = aws_vpc.VPC-DevOps.id
  cidr_block              = "10.0.13.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "private-DevOps-3"
  }
}

resource "aws_subnet" "private-DevOps-4" {
  vpc_id                  = aws_vpc.VPC-DevOps.id
  cidr_block              = "10.0.14.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1d"

  tags = {
    Name = "private-DevOps-4"
  }
}

resource "aws_subnet" "private-DevOps-5" {
  vpc_id                  = aws_vpc.VPC-DevOps.id
  cidr_block              = "10.0.15.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1f"

  tags = {
    Name = "private-DevOps-5"
  }
}

# Internet GW for DevOps
resource "aws_internet_gateway" "GW-DevOps" {
  vpc_id = aws_vpc.VPC-DevOps.id

  tags = {
    Name = "GW-DevOps"
  }
}

# route tables for DevOps
resource "aws_route_table" "public-DevOps" {
  vpc_id = aws_vpc.VPC-DevOps.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.GW-DevOps.id
  }

  tags = {
    Name = "public-DevOps-1"
  }
}

# route associations public
resource "aws_route_table_association" "public-DevOps-1-a" {
  subnet_id      = aws_subnet.public-DevOps-1.id
  route_table_id = aws_route_table.public-DevOps.id
}

resource "aws_route_table_association" "public-DevOps-2-a" {
  subnet_id      = aws_subnet.public-DevOps-2.id
  route_table_id = aws_route_table.public-DevOps.id
}

resource "aws_route_table_association" "public-DevOps-3-a" {
  subnet_id      = aws_subnet.public-DevOps-3.id
  route_table_id = aws_route_table.public-DevOps.id
}

resource "aws_route_table_association" "public-DevOps-4-a" {
  subnet_id      = aws_subnet.public-DevOps-4.id
  route_table_id = aws_route_table.public-DevOps.id
}

resource "aws_route_table_association" "public-DevOps-5-a" {
  subnet_id      = aws_subnet.public-DevOps-5.id
  route_table_id = aws_route_table.public-DevOps.id
}
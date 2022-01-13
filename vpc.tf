resource "aws_vpc" "Demo_VPC" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Demo_vpc"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.Demo_VPC.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.Demo_VPC.id
  cidr_block        = "10.0.16.0/20"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-subnet"
  }
}
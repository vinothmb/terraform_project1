resource "aws_internet_gateway" "Demo-igw" {
  vpc_id = aws_vpc.Demo_VPC.id
  tags = {
    Name = "Demo-igw"
  }
}


resource "aws_route_table" "private_crt" {
  vpc_id = aws_vpc.Demo_VPC.id
  tags = {
    Name = "private-crt"
  }
}


resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.Demo_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Demo-igw.id
  }

  tags = {
    Name = "public_crt"
  }
}


resource "aws_route_table_association" "public-subnet-asso" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_route_table_association" "private-subnet-asso" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private_crt.id
}



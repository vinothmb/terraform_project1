resource "aws_security_group" "public-sg" {
  vpc_id = aws_vpc.Demo_VPC.id

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "public-ingress-sg"
  }

  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}
  
resource "aws_security_group" "private-sg" {
  vpc_id = aws_vpc.Demo_VPC.id

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["10.0.16.0/20"]
    }
  }

  tags = {
    Name = "private-sg"
  }
}


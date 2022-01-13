output "instance-id" {
  value = aws_instance.instances[*].id
}

output "VPC-id" {
  value = aws_vpc.Demo_VPC.id
}

output "public-subnet_id" {
  value = aws_subnet.public-subnet.id
}


output "private-subnet_id" {
  value = aws_subnet.private-subnet.id
}


output "public-sg-id" {
  value = aws_security_group.public-sg.id
}


output "private-sg-id" {
  value = aws_security_group.private-sg.id
}


output "igw-id" {
  value = aws_internet_gateway.Demo-igw.id
}

output "public-route-table-id" {
  value = aws_route_table.public_crt.id
}


output "private-route-table-id" {
  value = aws_route_table.private_crt.id
}

output "public-ip" {
  value = aws_instance.instances[0].public_ip
}

output "alb-dns-name" {
  value = aws_lb.Demo-elb.dns_name
}

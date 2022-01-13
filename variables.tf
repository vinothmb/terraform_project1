variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ec2_keypair" {
  default = "vinothmugi"
}

variable "ec2_count" {
  type    = number
  default = 2
}


variable "sg_ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [80, 8080, 22]
}

variable "subnet" {
  default = ["subnet-0fa9fa5e2764c96d3", "subnet-0f8d23ec4ecf16271"]
}





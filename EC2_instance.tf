resource "aws_instance" "instances" {
  ami                    = data.aws_ami.web_ami.id
  instance_type          = var.instance_type
  key_name               = var.ec2_keypair
  count                  = var.ec2_count
  vpc_security_group_ids = ["${aws_security_group.public-sg.id}", "${aws_security_group.private-sg.id}"]
  subnet_id              = element(var.subnet, count.index)
  tags = {
    Name = "instances-${count.index + 1}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      #"sudo echo "Success Muthu Can you assign me a project" >> /var/www/html/index.html"
      "sudo chmod +x /var/www/html/index.html",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
    ]
  }
  connection {
    type        = "ssh"
    host        = aws_instance.instances[0].public_ip
    user        = "EC2_USER"
    password    = ""
    private_key = file("vinothmugi.pem")
  }
}













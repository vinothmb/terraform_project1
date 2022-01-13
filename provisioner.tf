resource "null_resource" "Demo-provisioner" {

  connection {
    type        = "ssh"
    host        = aws_instance.instances[0].public_ip
    user        = "ec2-user"
    private_key = file("vinothmugi.pem")
  }


  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"
  }
/*
  provisioner "file" {
    source      = "terraform.sh"
    destination = "/tmp/terraform.sh"
  }
*/

  provisioner "remote-exec" {
    inline = [
      "sudo sh /tmp/terraform.sh",
    ]
  }
}




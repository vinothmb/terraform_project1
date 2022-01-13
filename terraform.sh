#!/bin/sh
sudo yum update -y
sudo yum install httpd -y
sudo cp /tmp/index.html /var/www/html/index.html
sudo chmod +x /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd
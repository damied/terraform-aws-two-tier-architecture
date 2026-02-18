#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<html><h1>Welcome to my KDT Web Server!</h1></html>" > /var/www/html/index.html
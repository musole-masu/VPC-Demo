#!/bin/bash
yum -update -y
yum install -y httpd
systemctl start httpd
systemct enable httpd
echo "<h1>EC2 Instance: Bob Marley and The Wailers ⚡️</h1>" > /var/www/html/index.html
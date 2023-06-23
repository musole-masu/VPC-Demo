# AWS VPC-Demo

A Terraform configuration for a VPC providing networking capabilities to a virtual Linux. The VPC is to have two subnets:

- Public subnet with an IPv4 CIDR block of 10.1.1.0/25 or 128 IP addresses ranging from 10.1.1.0 to 10.1.1.127
- Private subnet with an IPV4 CIDR block of 10.1.1.128/25 also with 128 IP addresses from 10.1.1.128 to 10.1.1.255



server and the way we built it up simply answers the question asked in the beginning about what would make EC2 instances accessible to the internet.
A Terraform configuration to provision a virtual private cloud on AWS with two subnets, a public subnet where EC2 instances should expose to the Internet and a private for confidential instances.

![vpc-rt-igw](https://github.com/musole-masu/VPC-Demo/assets/85555092/42c39715-c922-465e-80c3-4861d58449b4)

![image](https://github.com/musole-masu/VPC-Demo/assets/85555092/f0aff1dd-bf1d-4e25-bd46-737e48c6bf84)


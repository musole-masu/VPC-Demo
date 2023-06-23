# AWS VPC-Demo

A Terraform configuration for a VPC providing networking capabilities to a virtual Linux. The VPC is to have two subnets:

- Public subnet with an IPv4 CIDR block of 10.1.1.0/25 or 128 IP addresses ranging from 10.1.1.0 to 10.1.1.127
- Private subnet with an IPV4 CIDR block of 10.1.1.128/25 also with 128 IP addresses from 10.1.1.128 to 10.1.1.255

![image](https://github.com/musole-masu/VPC-Demo/assets/85555092/0ea48489-5a55-4525-8b4c-8f5a2c1b7217)

This configuration will create an Internet Gateway to connect the VPC to the Internet.
![image](https://github.com/musole-masu/VPC-Demo/assets/85555092/f427a6e9-73a7-4fc5-8f47-ce6a05dd6fe1)

Additionally, it will create a route table to govern network traffics between the VPC public subnet and its Internet gateway
![image](https://github.com/musole-masu/VPC-Demo/assets/85555092/6a69a7f9-a57f-4dd7-99a2-8623e7fb3a3f)



![image](https://github.com/musole-masu/VPC-Demo/assets/85555092/f0aff1dd-bf1d-4e25-bd46-737e48c6bf84)


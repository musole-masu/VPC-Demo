# for VPC creation
resource "aws_vpc" "VPC_Demo" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"
  
  tags = {
    Name = "VPC Demo"
  }
}

# for Public Subnet creation
resource "aws_subnet" "Public_subnet" {
    tags = {
      Name = "Public-Subnet"
    }

    cidr_block = "${var.public_subnet_cidr}"
    vpc_id = aws_vpc.VPC_Demo.id
    map_public_ip_on_launch = true
    availability_zone = "us-west-2a"
}

# for Private Subnet creation
resource "aws_subnet" "Private_subnet" {
  tags = {
    Name = "Private-Subnet"
  }

  cidr_block = "${var.private_subnet_cidr}"
  vpc_id = aws_vpc.VPC_Demo.id
  availability_zone = "us-west-2a"
}

# Internet gateway for internet access with public subnet
resource "aws_internet_gateway" "VPC_Demo_IGW" {
    tags = {
      Name = "VPC_Demo_IGW"
    }
    vpc_id = aws_vpc.VPC_Demo.id
}

# route table for public subnet: regulate network traffics
resource "aws_route_table" "VPC_Demo_PUB_RT" {
  vpc_id = aws_vpc.VPC_Demo.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.VPC_Demo_IGW.id
  }

  tags = {
      Name = "VPC_Demo_PUB_RT"
  }
}

# route table subnet association
resource "aws_route_table_association" "VPC_Demo_PUB_RT_ASS" {
  subnet_id = aws_subnet.Public_subnet.id
  route_table_id = aws_route_table.VPC_Demo_PUB_RT.id
}

# for an EC2 instance with Apache http server
resource "aws_instance" "Reggae_Vibration" {
    ami = "ami-07dfed28fcf95241c" # Amazon Linux 2023 AMI us-west-2
    instance_type = "t2.micro"
    vpc_security_group_ids = [ aws_security_group.Reggae_Vibration.id ]
    subnet_id = aws_subnet.Public_subnet.id
    user_data = "${file("init_ec2_config.sh")}"

    tags = {
      Name = "Reggae_Vibration"
    }
}

# security group for the reggae vibration ec2 instance
resource "aws_security_group" "Reggae_Vibration" {

  name = "reggae_vibration_security_group"
  vpc_id = aws_vpc.VPC_Demo.id

  # allowing incoming HTTP traffic
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
  }

  # allowing incoming ssh traffic
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
  }

  # allowing all outgoing traffic
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
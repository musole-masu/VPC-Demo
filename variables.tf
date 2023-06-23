# for aws region
variable "aws_region" {
  default = "us-west-2"
}

# for VPC CIDR Block
variable "vpc_cidr" {
  default = "10.1.1.0/24"
}

# for public subnet cidr block
variable "public_subnet_cidr" {
  default = "10.1.1.0/25"
}

# for private subnet cidr block
variable "private_subnet_cidr" {
    default = "10.1.1.128/25"
}
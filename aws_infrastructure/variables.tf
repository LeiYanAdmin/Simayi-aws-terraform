variable "region" {
  description = "The AWS region to create resources in"
  type = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name tag for the VPC"
  type = string
  default = "my-vpc"
}

variable "public_subnets_cidr" {
  description = "The CIDR blocks for the public subnets"
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidr" {
  description = "The CIDR blocks for the private subnets"
  type = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "subnet_name" {
  description = "The name tag for the subnets"
  type = string
  default = "my-subnet"
}

variable "igw_name" {
  description = "The name tag for the Internet Gateway"
  type = string
  default = "my-igw"
}

variable "nat_name" {
  description = "The name tag for the NAT Gateway"
  type = string
  default = "my-nat"
}

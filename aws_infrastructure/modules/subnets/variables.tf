variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnets_cidr" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
}

variable "private_subnets_cidr" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
}

variable "subnet_name" {
  description = "The name tag for the subnets"
  type        = string
}

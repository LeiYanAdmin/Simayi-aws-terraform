provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
  public_subnets_cidr = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  subnet_name = var.subnet_name
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
  igw_name = var.igw_name
}

module "nat_gateway" {
  source = "./modules/nat_gateway"
  public_subnet_id = element(module.subnets.public_subnet_ids, 0)
  nat_name = var.nat_name
}

resource "aws_route_table" "public" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.internet_gateway.internet_gateway_id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

resource "aws_route_table" "private" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = module.nat_gateway.nat_gateway_id
  }

  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}

resource "aws_route_table_association" "public" {
  count = 2
  subnet_id = element(module.subnets.public_subnet_ids, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = 2
  subnet_id = element(module.subnets.private_subnet_ids, count.index)
  route_table_id = aws_route_table.private.id
}

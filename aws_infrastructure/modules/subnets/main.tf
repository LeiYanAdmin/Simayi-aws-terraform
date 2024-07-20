resource "aws_subnet" "public" {
  count = 2
  cidr_block = element(var.public_subnets_cidr, count.index)
  vpc_id = var.vpc_id
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.subnet_name}-public-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count = 2
  cidr_block = element(var.private_subnets_cidr, count.index)
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.subnet_name}-private-${count.index}"
  }
}

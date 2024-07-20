resource "aws_eip" "nat" {
  vpc = true
  tags = {
    Name = "${var.nat_name}-eip"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id = var.public_subnet_id
  tags = {
    Name = var.nat_name
  }
}
